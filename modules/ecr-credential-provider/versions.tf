terraform {
  required_providers {
    ignition = {
      source = "terraform-providers/ignition"
      version = "2.1.2"
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
