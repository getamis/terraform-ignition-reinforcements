locals {
  crictl_config = {
    runtime-endpoint = "unix:///run/containerd/containerd.sock"
    image-endpoint   = "unix:///run/containerd/containerd.sock"
    timeout          = 2
  }
}

data "ignition_file" "containerd_config" {
  mode      = 292
  path      = "/etc/containerd/config.toml"
  overwrite = true

  content {
    content = templatefile("${path.module}/files/config.toml", {
      log_level = var.log_level
    })
  }
}

data "ignition_file" "crictl_config" {
  path      = "/etc/crictl.yaml"
  mode      = 420
  overwrite = true

  content {
    content = templatefile("${path.module}/files/crictl.yaml.tpl", {
      content = local.crictl_config
    })
    mime = "text/yaml"
  }
}