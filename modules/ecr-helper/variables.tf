variable "binary" {
  description = "Desired binary file url and checksum(sha512)."
  type = object({
    source   = string
    checksum = string
  })
  default = {
    source   = "https://amazon-ecr-credential-helper-releases.s3.us-east-2.amazonaws.com/0.5.0/linux-amd64/docker-credential-ecr-login"
    checksum = "sha512-2b07b612740514ce22f31645842316bdc07bdf8c0368e0652cd1ae61a8f9a6b2b58edb04ffbec884872d860668b3a4e102d1dfae16967b703eeb0f15e18ee22a"
  }
}

variable "ecr_helper_config" {
  description = "The config for container ecr helper"
  type = object({
    credsStore  = string
    credHelpers = map(string)
  })
  default = {
    credsStore = "ecr-login"
    credHelpers = {
      "account_id.dkr.ecr.region.amazonaws.com" = "ecr-login"
    }
  }
}