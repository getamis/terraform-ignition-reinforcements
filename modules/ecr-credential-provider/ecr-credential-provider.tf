data "ignition_file" "ecr_credential_provider" {
  path       = "/opt/bin/ecr-credential-provider/ecr-credential-provider"
  mode       = 493
  overwrite  = true

  source {
    source       = var.binary.source
    verification = var.binary.checksum
  }
}