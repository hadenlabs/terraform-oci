#
# ----------------------------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# These variables must be set when using this module.
# ----------------------------------------------------------------------------------------------------------------------

variable "compartment_id" {
  description = "The OCID of the compartment"
  type        = string
}

variable "vcn_id" {
  description = "The OCID of the VCN"
  type        = string
}

variable "cidr_block" {
  description = "The CIDR block for the subnet. Must be a valid CIDR within the VCN's CIDR range and not overlap with other subnets in the same VCN."
  type        = string
}

variable "display_name" {
  description = "The display name of the subnet"
  type        = string
}

# ----------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# These variables have default values and don't need to be set.
# ----------------------------------------------------------------------------------------------------------------------

variable "availability_domain" {
  description = "The availability domain for the subnet. If not specified, the subnet will be regional."
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

# network_security_group_ids is not supported in oci_core_subnet resource
# Use oci_core_network_security_group resource instead

variable "prohibit_public_ip_on_vnic" {
  description = "Whether to prohibit public IP addresses on VNICs in this subnet. Set to true for private subnets, false for public subnets."
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
  description = "A DNS label for the subnet, used in conjunction with the VNIC's hostname and VCN's DNS label to form a fully qualified domain name (FQDN) for instances in this subnet"
  type        = string
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
