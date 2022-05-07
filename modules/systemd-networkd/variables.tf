variable "debug" {
  description = "(Optional) Enable CoreOS Systemd Networkd debug log or not"
  type        = bool
  default     = false
}

variable "manage_foreign_policy" {
  description = "(Optional) The FlatCar CoreOS version before 3033.2.2 needs to add systemd-networkd config to force unmanage of foreign routes and rules, otherwise it will be unmanaged by default"
  type        = bool
  default     = false
}