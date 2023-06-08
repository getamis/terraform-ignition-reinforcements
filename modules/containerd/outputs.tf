output "files" {
  value = [
    data.files.containerd_config.rendered
  ]
}
