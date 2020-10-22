module "ignition_docker" {
  source = "../modules/docker"
}

module "ignition_locksmithd" {
  source = "../modules/locksmithd"
}

module "ignition_update_ca_certificates" {
  source = "../modules/update-ca-certificates"
}

data "ignition_config" "main" {
  files = concat(
    module.ignition_docker.files,
    module.ignition_locksmithd.files,
    module.ignition_update_ca_certificates.files,
  )

  systemd = concat(
    module.ignition_docker.systemd_units,
    module.ignition_locksmithd.systemd_units,
    module.ignition_update_ca_certificates.systemd_units,
  )
}

resource "local_file" "file" {
  content  = data.ignition_config.main.rendered
  filename = "${path.root}/output/result.ign"
}