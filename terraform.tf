terraform {
  required_version = "~> 1.13"

  backend "local" {
  }

  required_providers {
    lxd = {
      source  = "terraform-lxd/lxd"
      version = "~> 2.6"
    }
  }
}
