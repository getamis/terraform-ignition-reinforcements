data "ignition_systemd_unit" "update_ca_certificates_dropin" {
  name    = "update-ca-certificates.service"
  enabled = true

  dropin {
    name    = "10-always-update-ca-certificates.conf"
    content = templatefile("${path.module}/templates/10-always-update-ca-certificates.conf.tpl", {})
  }
}
