output "systemd_units" {
  value = [
    data.ignition_systemd_unit.update_ca_trust_dropin.rendered
  ]
}

output "files" {
  value = []
}
