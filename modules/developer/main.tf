locals {
  name = basename(abspath(path.module))
}

resource "lxd_instance" "this" {
  name  = local.name
  image = var.image

  config = {
    "boot.autostart" = true

    # "security.privileged" = true
  }

  limits = {
    cpu    = 4
    memory = "16GB"
  }

  profiles = [
    module.cloudinit.profile.name,
    module.macvlan.profile.name,
    module.rootfs.profile.name,
  ]

  device {
    name = "docker"
    type = "disk"
    properties = {
      path   = "/mnt/docker.sock"
      source = "/run/docker.sock"
    }
  }
}

module "cloudinit" {
  source = "../../lib/lxd/cloud-init"

  name = "${local.name}-cloudinit"

  user_data = file("${path.module}/cloud-init/user-data.yaml")

  network_config = templatestring(var.macvlan.netplan_template, {
    addresses = var.macvlan.addresses,
  })
}

module "macvlan" {
  source = "../../lib/lxd/macvlan"

  name = "${local.name}-macvlan"

  parent = var.macvlan.parent
}

module "rootfs" {
  source = "../../lib/lxd/rootfs"

  name = "${local.name}-rootfs"
}
