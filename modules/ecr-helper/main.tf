data "ignition_file" "ecr_helper" {
  path       = "/opt/bin/docker-credential-ecr-login"
  mode       = 493
  overwrite  = true

  source {
    source       = var.binary.source
    verification = var.binary.checksum
  }
}

data "ignition_file" "config_json" {
  mode       = 420
  path = "/root/.docker/config.json"
  overwrite  = true

  content {
    content = templatefile("${path.module}/templates/config.json.tpl", {})
    mime = "text/json"
  }
}
