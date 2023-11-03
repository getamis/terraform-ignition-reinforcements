# the systemd-networkd configuration file 10-eni.network and 10-eth.network need to be adjusted after systemd updated
# Reference: https://github.com/aws/amazon-vpc-cni-k8s/issues/1600

data "ignition_file" "systemd_networkd_log_level" {

  mode      = 420
  path      = "/etc/systemd/system/systemd-networkd.service.d/10-log-level.conf"
  overwrite = true

  content {
    content = templatefile("${path.module}/templates/10-log-level.conf.tpl", {
      log_level = var.log_level
    })
  }
}

data "ignition_file" "systemd_networkd_eni" {

  mode      = 420
  path      = "/etc/systemd/network/10-eni.network"
  overwrite = true

  content {
    content = file("${path.module}/files/10-eni.network")
  }
}

data "ignition_file" "systemd_networkd_eth0" {

  mode      = 420
  path      = "/etc/systemd/network/10-eth0.network"
  overwrite = true

  content {
    content = file("${path.module}/files/10-eth0.network")
  }
}

data "ignition_file" "systemd_networkd_ethn" {

  mode      = 420
  path      = "/etc/systemd/network/10-ethn.network"
  overwrite = true

  content {
    content = file("${path.module}/files/10-ethn.network")
  }
}