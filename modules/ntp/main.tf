data "ignition_file" "ntp_dropin" {
  path       = "/etc/systemd/timesyncd.conf.d/10-timesyncd.conf"
  
  mode       = 420
  overwrite  = true

  content {
    content = templatefile("${path.module}/templates/10-timesyncd.conf.tpl", {
      ntp_servers = join(" ", var.ntp_servers)
    })
  }
}
