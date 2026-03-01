locals {
  defaults = {}

  input = {
    compartment_id = var.compartment_id
    cidr_blocks    = var.cidr_blocks
    display_name   = var.display_name
    dns_label      = var.dns_label
    defined_tags   = var.defined_tags
    freeform_tags  = var.freeform_tags
    is_ipv6enabled = var.is_ipv6enabled

    module_enabled = var.module_enabled
  }

  generated = {
    compartment_id = local.input.compartment_id
    cidr_blocks    = local.input.cidr_blocks
    display_name   = local.input.display_name
    dns_label      = local.input.dns_label
    defined_tags   = local.input.defined_tags
    freeform_tags  = local.input.freeform_tags
    is_ipv6enabled = local.input.is_ipv6enabled

    module_enabled = local.input.module_enabled
  }

  outputs = {
    compartment_id = local.generated.compartment_id
    cidr_blocks    = local.generated.cidr_blocks
    display_name   = local.generated.display_name
    dns_label      = local.generated.dns_label
    defined_tags   = local.generated.defined_tags
    freeform_tags  = local.generated.freeform_tags
    is_ipv6enabled = local.generated.is_ipv6enabled

    module_enabled = local.generated.module_enabled
  }
}

resource "oci_core_vcn" "this" {
  count = local.outputs.module_enabled ? 1 : 0

  compartment_id = local.outputs.compartment_id
  cidr_blocks    = local.outputs.cidr_blocks
  display_name   = local.outputs.display_name
  dns_label      = local.outputs.dns_label
  defined_tags   = local.outputs.defined_tags
  freeform_tags  = local.outputs.freeform_tags
  is_ipv6enabled = local.outputs.is_ipv6enabled
}
