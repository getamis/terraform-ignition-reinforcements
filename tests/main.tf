terraform {
  required_version = ">= 1.0.0"

  required_providers {
    ignition = {
      source  = "community-terraform-providers/ignition"
      version = "~> 2.1"
    }
  }
}

module "ignition_update_ca_certificates" {
  source = "../modules/update-ca-certificates"
}

module "ignition_node_exporter" {
  source = "../modules/node-exporter"
}

module "ignition_ntp" {
  source = "../modules/ntp"
  ntp_servers = [
    "server 0.tw.pool.ntp.org",
    "server 1.tw.pool.ntp.org",
  ]
}

module "ignition_ecr_helper" {
  source = "../modules/ecr-helper"
}

data "ignition_config" "main" {
  files = concat(
    module.ignition_update_ca_certificates.files,
    module.ignition_node_exporter.files,
    module.ignition_ntp.files,
    module.ignition_ecr_helper.files,
  )

  systemd = concat(
    module.ignition_update_ca_certificates.systemd_units,
    module.ignition_node_exporter.systemd_units,
    module.ignition_ntp.systemd_units,
    module.ignition_ecr_helper.systemd_units,
  )
}

resource "local_file" "file" {
  content  = data.ignition_config.main.rendered
  filename = "${path.root}/output/result.ign"
}