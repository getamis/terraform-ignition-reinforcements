# the systemd-networkd configuration file 10-eni.network and 10-eth.network need to be adjusted after systemd updated
# Reference: https://github.com/aws/amazon-vpc-cni-k8s/issues/1600

locals {
  systemd_log_level = var.debug ? "debug" : "warning"
}

data "ignition_file" "systemd_networkd_log_level" {
  filesystem = "root"
  mode       = 420
  path       = "/etc/systemd/system/systemd-networkd.service.d/10-log-level.conf"

  content {
    content = templatefile("${path.module}/templates/10-log-level.conf.tpl", {
      log_level = local.systemd_log_level
    })
  }
}

data "ignition_file" "systemd_networkd_eni" {
  filesystem = "root"
  mode       = 420
  path       = "/etc/systemd/network/10-eni.network"

  content {
    content = file("${path.module}/files/10-eni.network")
  }
}

data "ignition_file" "systemd_networkd_eth0" {
  filesystem = "root"
  mode       = 420
  path       = "/etc/systemd/network/10-eth0.network"

  content {
    content = file("${path.module}/files/10-eth0.network")
  }
}

data "ignition_file" "systemd_networkd_ethn" {
  filesystem = "root"
  mode       = 420
  path       = "/etc/systemd/network/10-ethn.network"

  content {
    content = file("${path.module}/files/10-ethn.network")
  }
}