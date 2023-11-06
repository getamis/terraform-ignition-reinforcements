locals {
  docker_opts   = concat(var.docker_opts, ["--log-level", var.log_level])
  docker_cgroup = concat(var.docker_cgroups, var.docker_cgroup_driver == "systemd" ? ["--exec-opt native.cgroupdriver=systemd"] : [""])
}

data "ignition_systemd_unit" "docker_dropin" {
  name    = "docker.service"
  enabled = true

  dropin {
    name = "10-dockeropts.conf"
    content = templatefile("${path.module}/templates/10-dockeropts.conf.tpl", {
      docker_opts    = join(" ", local.docker_opts)
      docker_cgroups = join(" ", local.docker_cgroup)
    })
  }
}
