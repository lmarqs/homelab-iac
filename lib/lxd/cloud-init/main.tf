variable "name" {
  description = "The resources name"
  type        = string
}

variable "project" {
  description = "The project to create the resources in"
  type        = string
  default     = "default"
}

variable "user_data" {
  description = "value of cloud-init.user-data"
  type        = string
  default     = "#cloud-config"
}

variable "vendor_data" {
  description = "value of cloud-init.vendor-data"
  type        = string
  default     = "#cloud-config"
}

variable "network_config" {
  description = "value of cloud-init.network-config"
  type        = string
  default     = null
}

resource "lxd_profile" "this" {
  name    = var.name
  project = var.project

  config = {
    "cloud-init.user-data"      = var.user_data
    "cloud-init.network-config" = var.network_config
    "cloud-init.vendor-data"    = var.vendor_data
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
