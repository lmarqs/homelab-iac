variable "name" {
  description = "The resources name"
  type        = string
}

variable "project" {
  description = "The project to create the resources in"
  type        = string
  default     = "default"
}

variable "storage_pool" {
  description = "The storage pool to use"
  type        = string
  default     = "default"
}

resource "lxd_profile" "this" {
  name    = var.name
  project = var.project

  device {
    name = "root"
    type = "disk"

    properties = {
      pool = var.storage_pool
      path = "/"
    }
  }
}

output "profile" {
  value = lxd_profile.this
}

terraform {
  required_providers {
    lxd = {
      source = "terraform-lxd/lxd"
    }
  }
}
