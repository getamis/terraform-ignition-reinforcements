output "systemd_units" {
  value = [
  ]
}

output "files" {
  value = concat(
    [
      data.ignition_file.systemd_networkd_eni.rendered,
      data.ignition_file.systemd_networkd_eth.rendered,
    ],
    var.debug_log ? [data.ignition_file.systemd_networkd_debug.rendered] : []
  )
}