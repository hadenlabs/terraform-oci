variable "compartment_id" {
  description = "The OCID of the compartment"
  type        = string
}

variable "vcn_id" {
  description = "The OCID of the VCN"
  type        = string
}

variable "cidr_block" {
  description = "The CIDR block for the subnet"
  type        = string
}

variable "display_name" {
  description = "The display name of the subnet"
  type        = string
}

variable "availability_domain" {
  description = "The availability domain for the subnet"
  type        = string
  default     = null
}

variable "route_table_id" {
  description = "The OCID of the route table to associate with the subnet"
  type        = string
  default     = null
}

variable "security_list_ids" {
  description = "List of security list OCIDs to associate with the subnet"
  type        = list(string)
  default     = []
}

variable "prohibit_public_ip_on_vnic" {
  description = "Whether to prohibit public IP addresses on VNICs in this subnet"
  type        = bool
  default     = true
}

variable "defined_tags" {
  description = "Defined tags for the subnet"
  type        = map(string)
  default     = {}
}

variable "freeform_tags" {
  description = "Freeform tags for the subnet"
  type        = map(string)
  default     = {}
}

variable "dns_label" {
  description = "A DNS label for the subnet"
  type        = string
  default     = null
}

variable "module_enabled" {
  description = "Controls whether to create the subnet"
  type        = bool
  default     = true
}
