// network/80-ec2.network
data "ignition_file" "ec2_network" {
  path = "/opt/lib/80-ec2.network"
  mode = 420 # 0644
  content {
    content = file("${path.module}/files/systemd/network/80-ec2.network")
  }
}

// system/policy-routes@.service
data "ignition_systemd_unit" "policy_routes" {
  name    = "policy-routes@.service"
  content = file("${path.module}/files/systemd/system/policy-routes@.service")
}

// system/refresh-policy-routes@.service
data "ignition_systemd_unit" "refresh_policy_routes" {
  name    = "refresh-policy-routes@.service"
  content = file("${path.module}/files/systemd/system/refresh-policy-routes@.service")
}

// system/refresh-policy-routes@.timer
data "ignition_systemd_unit" "refresh_policy_routes_timer" {
  name    = "refresh-policy-routes@.timer"
  content = file("${path.module}/files/systemd/system/refresh-policy-routes@.timer")
}
