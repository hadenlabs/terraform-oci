module "subnet" {
  source = "../.."

  # Required variables
  compartment_id = var.compartment_id
  vcn_id         = var.vcn_id
  cidr_block     = var.cidr_block
  display_name   = var.display_name

  # Optional variables
  availability_domain        = var.availability_domain
  route_table_id             = var.route_table_id
  security_list_ids          = var.security_list_ids
  prohibit_public_ip_on_vnic = var.prohibit_public_ip_on_vnic
  defined_tags               = var.defined_tags
  freeform_tags              = var.freeform_tags
  dns_label                  = var.dns_label

  # Module configuration
  module_enabled = var.module_enabled
}
