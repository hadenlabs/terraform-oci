#
# ----------------------------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# These variables must be set when using this module.
# ----------------------------------------------------------------------------------------------------------------------

variable "compartment_id" {
  description = "The OCID of the parent compartment. Use the tenancy OCID for root compartments."
  type        = string
}

variable "name" {
  description = "The name of the compartment. Must be unique within the parent compartment."
  type        = string
}

variable "description" {
  description = "The description of the compartment."
  type        = string
}

# ----------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# These variables have default values and don't need to be set.
# ----------------------------------------------------------------------------------------------------------------------

variable "defined_tags" {
  description = "Defined tags for the compartment"
  type        = map(string)
  default     = {}
}

variable "freeform_tags" {
  description = "Freeform tags for the compartment"
  type        = map(string)
  default     = {}
}

variable "enable_delete" {
  description = "Whether the compartment can be deleted. If false, compartment must be manually deleted before Terraform destroy."
  type        = bool
  default     = true
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
