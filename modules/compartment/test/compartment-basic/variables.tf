variable "compartment_id" {
  description = "The OCID of the parent compartment"
  type        = string
}

variable "name" {
  description = "The name of the compartment"
  type        = string
}

variable "description" {
  description = "The description of the compartment"
  type        = string
}

variable "enable_delete" {
  description = "Whether the compartment can be deleted"
  type        = bool
  default     = true
}

variable "freeform_tags" {
  description = "Freeform tags for the compartment"
  type        = map(string)
  default     = {}
}

variable "defined_tags" {
  description = "Defined tags for the compartment"
  type        = map(string)
  default     = {}
}

variable "module_enabled" {
  description = "Controls whether to create the compartment"
  type        = bool
  default     = true
}
