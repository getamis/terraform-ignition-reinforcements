data "ignition_systemd_unit" "sshd_disable" {
  name    = "sshd-disable.service"
  enabled = !var.enable
  content = file("${path.module}/files/services/sshd-disable.service")
}

data "ignition_file" "sshd_config" {

  mode      = 420
  overwrite = true

  path = "/etc/ssh/sshd_config"

  content {
    content = file("${path.module}/files/configs/sshd_config")
  }
}