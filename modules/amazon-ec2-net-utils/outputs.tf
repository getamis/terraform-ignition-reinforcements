output "systemd_units" {
  value = var.enabled ? [
    data.ignition_systemd_unit.policy_routes.rendered,
    data.ignition_systemd_unit.refresh_policy_routes.rendered,
    data.ignition_systemd_unit.refresh_policy_routes_timer.rendered,
  ] : []
}

output "files" {
  value = var.enabled ? [
    data.ignition_file.setup_policy_routes.rendered,
    data.ignition_file.lib_sh.rendered,
    data.ignition_file.sysctl_ipv6.rendered,
    data.ignition_file.udev_rule_vpc.rendered,
    // The current provider supports Ignition spec 3.x, which no longer has the networkd section.
    // https://github.com/community-terraform-providers/terraform-provider-ignition/issues/9#issuecomment-774221873
    data.ignition_file.ec2_network.rendered,
  ] : []
}
