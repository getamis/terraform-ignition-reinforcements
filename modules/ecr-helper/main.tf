data "ignition_file" "ecr_helper" {
  filesystem = "root"
  path       = "/opt/bin/docker-credential-ecr-login"
  mode       = 493

  source {
    source       = var.binary.source
    verification = var.binary.checksum
  }
}

data "ignition_file" "config_json" {
  filesystem = "root"
  mode       = 420

  path = "/root/.docker/config.json"

  content {
    content = templatefile("${path.module}/templates/config.json.tpl", {})
  }
}
