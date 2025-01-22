module "developer" {
  source = "./developer"

  image = lxd_cached_image.jammy.fingerprint

  macvlan = merge(var.macvlan, {
    addresses = slice(var.macvlan.addresses, 0, 1)
  })
}

module "swe" {
  source = "./swe"

  image = lxd_cached_image.jammy.fingerprint

  macvlan = merge(var.macvlan, {
    addresses = slice(var.macvlan.addresses, 1, 2)
  })
}
