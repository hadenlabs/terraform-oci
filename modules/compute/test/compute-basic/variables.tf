variable "compartment_id" {
  description = "The OCID of the compartment"
  type        = string
}

variable "availability_domain" {
  description = "The availability domain for the instance"
  type        = string
}

variable "display_name" {
  description = "The display name of the instance"
  type        = string
}

variable "ssh_public_key" {
  description = "The SSH public key for the instance"
  type        = string
}

variable "subnet_id" {
  description = "The OCID of the subnet"
  type        = string
}

variable "shape" {
  description = "The shape of the instance"
  type        = string
  default     = "VM.Standard.E4.Flex"
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
  default     = "image"
}

variable "boot_volume_size_in_gbs" {
  description = "The size of the boot volume in GBs"
  type        = number
  default     = null
}

variable "module_enabled" {
  description = "Controls whether to create the compute instance"
  type        = bool
  default     = true
}
