data "ignition_file" "setup_policy_routes" {
  mode = 493 # 0755

  path = "/opt/bin/setup-policy-routes"

  content {
    content = file("${path.module}/files/bin/setup-policy-routes.sh")
  }
}

data "ignition_file" "lib_sh" {
  mode = 420 # 0644

  path = "/opt/lib/ec2-net-utils-lib.sh"

  content {
    content = file("${path.module}/files/lib/lib.sh")
  }
}

// It's exist in flatcar before we add the 90-ipv6-dad.conf
data "ignition_file" "sysctl_ipv6" {
  mode = 420 # 0644

  path = "/etc/sysctl.d/90-ipv6-dad.conf"

  content {
    content = file("${path.module}/files/sysctl/90-ipv6-dad.conf")
  }
}

data "ignition_file" "udev_rule_vpc" {
  mode = 420 # 0644

  path = "/etc/udev/rules.d/99-vpc-policy-routes.rules"

  content {
    content = file("${path.module}/files/udev/99-vpc-policy-routes.rules")
  }
}
