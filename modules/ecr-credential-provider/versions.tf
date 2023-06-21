terraform {
  required_providers {
    ignition = {
      source = "terraform-providers/ignition"
    }
    local = {
      source = "hashicorp/local"
    }
    template = {
      source = "hashicorp/template"
    }
  }
  required_version = ">= 0.13"
}
