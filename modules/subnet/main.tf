locals {
  defaults = {}

  input = {
    compartment_id             = var.compartment_id
    vcn_id                     = var.vcn_id
    cidr_block                 = var.cidr_block
    display_name               = var.display_name
    availability_domain        = var.availability_domain
    route_table_id             = var.route_table_id
    security_list_ids          = var.security_list_ids
    prohibit_public_ip_on_vnic = var.prohibit_public_ip_on_vnic
    defined_tags               = var.defined_tags
    freeform_tags              = var.freeform_tags
    dns_label                  = var.dns_label

    module_enabled = var.module_enabled
  }

  generated = {
    compartment_id             = local.input.compartment_id
    vcn_id                     = local.input.vcn_id
    cidr_block                 = local.input.cidr_block
    display_name               = local.input.display_name
    availability_domain        = local.input.availability_domain
    route_table_id             = local.input.route_table_id
    security_list_ids          = local.input.security_list_ids
    prohibit_public_ip_on_vnic = local.input.prohibit_public_ip_on_vnic
    defined_tags               = local.input.defined_tags
    freeform_tags              = local.input.freeform_tags
    dns_label                  = local.input.dns_label

    module_enabled = local.input.module_enabled
  }

  outputs = {
    compartment_id             = local.generated.compartment_id
    vcn_id                     = local.generated.vcn_id
    cidr_block                 = local.generated.cidr_block
    display_name               = local.generated.display_name
    availability_domain        = local.generated.availability_domain
    route_table_id             = local.generated.route_table_id
    security_list_ids          = local.generated.security_list_ids
    prohibit_public_ip_on_vnic = local.generated.prohibit_public_ip_on_vnic
    defined_tags               = local.generated.defined_tags
    freeform_tags              = local.generated.freeform_tags
    dns_label                  = local.generated.dns_label

    module_enabled = local.generated.module_enabled
  }
}

resource "oci_core_subnet" "this" {
  count = local.outputs.module_enabled ? 1 : 0

  compartment_id      = local.outputs.compartment_id
  vcn_id              = local.outputs.vcn_id
  cidr_block          = local.outputs.cidr_block
  display_name        = local.outputs.display_name
  availability_domain = local.outputs.availability_domain
  route_table_id      = local.outputs.route_table_id
  security_list_ids   = local.outputs.security_list_ids
  # network_security_group_ids is not supported in oci_core_subnet resource
  # Use oci_core_network_security_group resource instead
  prohibit_public_ip_on_vnic = local.outputs.prohibit_public_ip_on_vnic
  defined_tags               = local.outputs.defined_tags
  freeform_tags              = local.outputs.freeform_tags
  dns_label                  = local.outputs.dns_label
}
