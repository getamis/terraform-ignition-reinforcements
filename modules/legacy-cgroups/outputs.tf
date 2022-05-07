output "systemd_units" {
  value = [
    data.ignition_systemd_unit.containerd_dropin.rendered
  ]
}

output "files" {
  value = [
    data.ignition_file.grub_cfg.rendered,
    data.ignition_file.flatcar_cgroupv1.rendered,
  ]
}

output "filesystems" {
  value = [
    data.ignition_filesystem.oem.rendered
  ]
}