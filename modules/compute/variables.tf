#
# ----------------------------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# These variables must be set when using this module.
# ----------------------------------------------------------------------------------------------------------------------


variable "compartment_id" {
  description = "The OCID of the compartment"
  type        = string
}

variable "availability_domain" {
  description = "The availability domain for the instance"
  type        = string
}

variable "shape" {
  description = "The shape of the instance"
  type        = string
  default     = "VM.Standard.E4.Flex"
}

variable "subnet_id" {
  description = "The OCID of the subnet"
  type        = string
}

variable "display_name" {
  description = "The display name of the instance"
  type        = string
}

variable "image_id" {
  description = "The OCID of the image"
  type        = string
}

variable "ssh_public_key" {
  description = "The SSH public key for the instance"
  type        = string
}

variable "metadata" {
  description = "Metadata for the instance"
  type        = map(string)
  default     = {}
}

variable "freeform_tags" {
  description = "Freeform tags for the instance"
  type        = map(string)
  default     = {}
}

variable "defined_tags" {
  description = "Defined tags for the instance"
  type        = map(string)
  default     = {}
}

variable "source_type" {
  description = "The source type for the instance"
  type        = string
  default     = "IMAGE"
}

variable "boot_volume_size_in_gbs" {
  description = "The size of the boot volume in GBs"
  type        = number
  default     = null
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
