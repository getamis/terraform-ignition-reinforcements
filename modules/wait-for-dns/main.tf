data "ignition_systemd_unit" "wait_for_dns" {
  name    = "wait-for-dns.service"
  enabled = true

  content = templatefile("${path.module}/templates/wait-for-dns.service.tpl", {
    required_service = var.required_service
  })
}