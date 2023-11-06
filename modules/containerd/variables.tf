variable "log_level" {
  description = "(Optional) containerd log level (trace, debug, info, warn, error, fatal, panic), default is info"
  type        = string
  default     = "info"
}
