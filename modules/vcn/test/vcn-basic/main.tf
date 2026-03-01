module "vcn" {
  source = "../.."

  # Required variables
  compartment_id = var.compartment_id
  cidr_blocks    = var.cidr_blocks
  display_name   = var.display_name

  # Optional variables
  dns_label      = var.dns_label
  freeform_tags  = var.freeform_tags
  defined_tags   = var.defined_tags
  is_ipv6enabled = var.is_ipv6enabled

  # Module configuration
  module_enabled = var.module_enabled
}
