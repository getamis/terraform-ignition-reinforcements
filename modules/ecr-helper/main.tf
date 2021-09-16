data "ignition_file" "ecr_helper" {
  path      = "/usr/local/bin/docker-credential-ecr-login"
  mode      = 493
  overwrite = true

  source {
    source       = var.binary.source
    verification = var.binary.checksum
  }
}

data "ignition_file" "config_json" {
  path      = "/root/.docker/config.json"
  mode      = 420
  overwrite = true

  content {
    content = jsonencode(var.ecr_helper_config)
  }
}
