locals {
  mask = var.enable ? false : true
}

data "ignition_systemd_unit" "sshd" {
  name = "sshd.service"
  mask = local.mask
}