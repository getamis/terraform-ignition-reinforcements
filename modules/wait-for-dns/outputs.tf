output "systemd_units" {
  value = [
    data.ignition_systemd_unit.wait_for_dns.rendered
  ]
}

output "files" {
  value = []
}
