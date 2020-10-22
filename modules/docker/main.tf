data "ignition_systemd_unit" "docker_dropin" {
  name    = "docker.service"
  enabled = true

  dropin {
    name = "10-dockeropts.conf"
    content = templatefile("${path.module}/templates/10-dockeropts.conf.tpl", {
      docker_opts = join(" ", var.docker_opts)
    })
  }
}
