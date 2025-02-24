terraform {
  required_providers {
    ignition = {
      source = "terraform-providers/ignition"
      version = "== 2.3.1"
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
