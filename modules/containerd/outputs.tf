output "files" {
  value = [
    data.ignition_file.containerd_config.rendered,
    data.ignition_file.crictl_config.rendered,
  ]
}
