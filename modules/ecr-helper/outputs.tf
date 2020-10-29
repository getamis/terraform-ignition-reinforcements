output "systemd_units" {
  value = []
}

output "files" {
  value = [
    data.ignition_file.ecr_helper.rendered,
    data.ignition_file.config_json.rendered,
  ]
}