module "ignition_docker" {
  source = "../modules/docker"
}

data "ignition_config" "main" {
  files = concat(
    module.ignition_docker.files,
  )

  systemd = concat(
    module.ignition_docker.systemd_units,
  )
}

resource "local_file" "file" {
  content  = data.ignition_config.main.rendered
  filename = "${path.root}/output/result.ign"
}