terraform {
  required_version = "~> 1.13"

  backend "remote" {
    organization = "lmarqs"

    workspaces {
      name = "homelab-iac"
    }
  }

  required_providers {
    lxd = {
      source  = "terraform-lxd/lxd"
      version = "~> 2.6"
    }
  }
}
