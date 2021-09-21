# the systemd-networkd configuration file 10-eni.network and 10-eth.network need to be adjusted after systemd updated
# Reference: https://github.com/aws/amazon-vpc-cni-k8s/issues/1600

data "ignition_file" "systemd_networkd_eni" {
  filesystem = "root"
  mode       = 420
  path       = "/etc/systemd/network/10-eni.network"

  content {
    content = file("${path.module}/file/10-eni.network")
  }
}

data "ignition_file" "systemd_networkd_eth" {
  filesystem = "root"
  mode       = 420
  path       = "/etc/systemd/network/10-eth.network"

  content {
    content = file("${path.module}/file/10-eth.network")
  }
}

data "ignition_file" "systemd_networkd_debug" {
  filesystem = "root"
  mode       = 420
  path       = "/etc/systemd/system/systemd-networkd.service.d/10-debug.conf"

  content {
    content = file("${path.module}/file/10-debug.conf")
  }
}