locals {
  docker_cgroup = join(var.docker_cgroups, var.docker_cgroup_driver == "systemd" ? "--exec-opt native.cgroupdriver=systemd" : "")
}

data "ignition_systemd_unit" "docker_dropin" {
  name    = "docker.service"
  enabled = true

  dropin {
    name = "10-dockeropts.conf"
    content = templatefile("${path.module}/templates/10-dockeropts.conf.tpl", {
      docker_opts = join(" ", var.docker_opts)
      docker_cgroups = local.docker_cgroup
    })
  }
}
