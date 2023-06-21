variable "binary" {
  description = "Desired binary file url and checksum(sha512)."
  type = object({
    source   = string
    checksum = string
  })
  default = {
    source   = "https://artifacts.k8s.io/binaries/cloud-provider-aws/v1.27.1/linux/amd64/ecr-credential-provider-linux-amd64"
    checksum = "sha512-b132e19a8b1330ae6b363e5332405f1781c71b73f36ca691c1f7add5a6573e39ce352e332062bf474489fb730906f172be024c7da3bc7aacbb49e6592832223c"
  }
}
