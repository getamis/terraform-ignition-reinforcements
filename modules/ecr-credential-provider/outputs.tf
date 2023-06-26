output "systemd_units" {
  value = []
}

output "files" {
  value = [
    data.ignition_file.ecr_credential_provider.rendered,
  ]
}