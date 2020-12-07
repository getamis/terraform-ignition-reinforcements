variable "binary" {
  description = "Desired binary file url and checksum(sha512)."
  type = object({
    source      = string
    checksum = string
  })
  default = {
    source      = "https://amazon-ecr-credential-helper-releases.s3.us-east-2.amazonaws.com/0.4.0/linux-amd64/docker-credential-ecr-login"
    checksum = "sha512-0e626449930b344ab2addc0730e35ac40a99fc0bbe8b4e90e7eeeb0b06e9b1e348a9477d3057a1d9963bb87cb18ff05bdebd95ef204ab160bb7518fa71faeea8"
  }
}
