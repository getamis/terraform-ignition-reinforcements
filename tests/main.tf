terraform {
  required_version = ">= 0.13.1"

  required_providers {
    ignition = {
      source  = "terraform-providers/ignition"
      version = "~> 1.2.1"
    }
  }
}

module "ignition_docker" {
  source = "../modules/docker"
}

module "ignition_ecr_helper" {
  source = "../modules/ecr-helper"
}

module "ignition_legacy_cgroups" {
  source = "../modules/legacy-cgroups"
}

module "ignition_locksmithd" {
  source = "../modules/locksmithd"
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

module "ignition_sshd" {
  source = "../modules/sshd"
}

module "ignition_systemd_networkd" {
  source = "../modules/systemd-networkd"
}

module "ignition_update_ca_certificates" {
  source = "../modules/update-ca-certificates"
}

data "ignition_config" "main" {
  files = concat(
    module.ignition_docker.files,
    module.ignition_ecr_helper.files,
    module.ignition_legacy_cgroups.files,
    module.ignition_locksmithd.files,
    module.ignition_node_exporter.files,
    module.ignition_ntp.files,
    module.ignition_sshd.files,
    module.ignition_systemd_networkd.files,
    module.ignition_update_ca_certificates.files,
  )

  systemd = concat(
    module.ignition_docker.systemd_units,
    module.ignition_ecr_helper.systemd_units,
    module.ignition_legacy_cgroups.systemd_units,
    module.ignition_locksmithd.systemd_units,
    module.ignition_node_exporter.systemd_units,
    module.ignition_ntp.systemd_units,
    module.ignition_sshd.systemd_units,
    module.ignition_systemd_networkd.systemd_units,
    module.ignition_update_ca_certificates.systemd_units,
  )
}

resource "local_file" "file" {
  content  = data.ignition_config.main.rendered
  filename = "${path.root}/output/result.ign"
}