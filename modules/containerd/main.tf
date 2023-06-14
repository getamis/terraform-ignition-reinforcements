data "ignition_file" "containerd_config" {
  mode      = 292
  path      = "/etc/containerd/config.toml"
  overwrite = true

  content {
    content = file("${path.module}/files/config.toml")
  }

}