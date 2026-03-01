variable "compartment_id" {
  description = "The OCID of the compartment"
  type        = string
}

variable "cidr_blocks" {
  description = "The list of IPv4 CIDR blocks for the VCN"
  type        = list(string)
}

variable "display_name" {
  description = "The display name of the VCN"
  type        = string
}

variable "dns_label" {
  description = "A DNS label for the VCN"
  type        = string
  default     = null
}

variable "freeform_tags" {
  description = "Freeform tags for the VCN"
  type        = map(string)
  default     = {}
}

variable "defined_tags" {
  description = "Defined tags for the VCN"
  type        = map(string)
  default     = {}
}

variable "is_ipv6enabled" {
  description = "Whether IPv6 is enabled for the VCN"
  type        = bool
  default     = false
}

variable "module_enabled" {
  description = "Controls whether to create the VCN"
  type        = bool
  default     = true
}
