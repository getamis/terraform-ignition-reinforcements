data "ignition_filesystem" "oem" {
  device = "/dev/disk/by-label/OEM"
  format = "btrfs"
}

data "ignition_file" "grub_cfg" {
  mode      = 420
  path      = "/usr/share/oem/grub.cfg"
  overwrite = true

  content {
    content = file("${path.module}/files/grub.cfg")
  }
}

data "ignition_file" "flatcar_cgroupv1" {
  mode      = 292
  path      = "/etc/flatcar-cgroupv1"
  overwrite = true

  content {
    content = ""
  }
}

data "ignition_systemd_unit" "containerd_dropin" {
  name    = "containerd.service"
  enabled = true

  dropin {
    name    = "10-use-cgroupfs.conf"
    content = file("${path.module}/files/10-use-cgroupfs.conf")
  }
}