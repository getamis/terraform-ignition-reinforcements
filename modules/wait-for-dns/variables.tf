variable "required_service" {
  description = "Which service required wait for dns"
  type        = string
  default     = "kubelet.service"
}
