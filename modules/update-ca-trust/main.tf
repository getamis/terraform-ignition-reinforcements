data "ignition_systemd_unit" "update_ca_trust_dropin" {
  name    = "update-ca-trust.service"
  enabled = true

  dropin {
    name    = "10-always-update-ca-trust.conf"
    content = templatefile("${path.module}/templates/10-always-update-ca-trust.conf.tpl", {})
  }
}
