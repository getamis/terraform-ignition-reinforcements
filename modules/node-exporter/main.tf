data "ignition_systemd_unit" "node_exporter_fetcher" {
  name    = "node-exporter-fetcher.service"
  enabled = true
  content = templatefile("${path.module}/templates/node-exporter-fetcher.service.tpl", {
    version = var.node_exporter_version
  })
}

data "ignition_systemd_unit" "node_exporter" {
  name    = "node-exporter.service"
  enabled = true
  content = templatefile("${path.module}/templates/node-exporter.service.tpl", {
    listen_address = "${var.listen_address}:${var.listen_port}"
  })
}
