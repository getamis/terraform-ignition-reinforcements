output "systemd_units" {
  value = [
    data.ignition_systemd_unit.sshd_disable.rendered
  ]
}

output "files" {
  value = [
    data.ignition_file.sshd_config.rendered
  ]
}
