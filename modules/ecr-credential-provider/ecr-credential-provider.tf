data "ignition_file" "ecr_credential_provider" {
  filesystem = "root"
  path       = "/opt/bin/ecr-credential-provider/ecr-credential-provider"
  mode       = 493

  source {
    source       = var.binary.source
    verification = var.binary.checksum
  }
}