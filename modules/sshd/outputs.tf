output "systemd_units" {
  value = [
    data.ignition_systemd_unit.sshd.rendered
  ]
}

output "files" {
  value = []
}
