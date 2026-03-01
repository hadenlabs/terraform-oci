#
# ----------------------------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# These variables must be set when using this module.
# ----------------------------------------------------------------------------------------------------------------------

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

# ----------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# These variables have default values and don't have to be set.
# ----------------------------------------------------------------------------------------------------------------------

variable "dns_label" {
  description = "A DNS label for the VCN"
  type        = string
  default     = null
}

variable "defined_tags" {
  description = "Defined tags for the VCN"
  type        = map(string)
  default     = {}
}

variable "freeform_tags" {
  description = "Freeform tags for the VCN"
  type        = map(string)
  default     = {}
}

variable "is_ipv6enabled" {
  description = "Whether IPv6 is enabled for the VCN"
  type        = bool
  default     = false
}

# ----------------------------------------------------------------------------------------------------------------------
# MODULE CONFIGURATION PARAMETERS
# These variables are used to configure the module.
# See https://medium.com/mineiros/the-ultimate-guide-on-how-to-write-terraform-modules-part-1-81f86d31f02
# ----------------------------------------------------------------------------------------------------------------------

variable "module_enabled" {
  type        = bool
  description = "(Optional) Whether to create resources within the module or not. Default is true."
  default     = true
}
