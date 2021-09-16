output "systemd_units" {
  value = []
}

output "files" {
  value = [
    data.ignition_file.zincati.rendered
  ]
}
