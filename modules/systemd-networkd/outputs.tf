output "systemd_units" {
  value = [
  ]
}

output "files" {
  value = concat(
    [
      data.ignition_file.systemd_networkd_log_level.rendered,
    ],
    var.manage_foreign_policy ? [
      data.ignition_file.systemd_networkd_eni.rendered,
      data.ignition_file.systemd_networkd_eth0.rendered,
      data.ignition_file.systemd_networkd_ethn.rendered,
    ] : []
  )
}