data "ignition_file" "zincati" {
  path      = "/etc/zincati/config.d/90-disable-auto-updates.toml"
  mode      = 420
  overwrite = true

  content {
    content = templatefile("${path.module}/templates/90-disable-auto-updates.toml.tpl", {
      auto_updates = var.auto_updates
    })
  }
}
