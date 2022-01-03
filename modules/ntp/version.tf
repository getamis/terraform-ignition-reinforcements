terraform {
  required_version = ">= 0.12.28"

  required_providers {
    ignition = {
      source  = "community-terraform-providers/ignition"
      version = "~> 1.3"
    }
  }
}
