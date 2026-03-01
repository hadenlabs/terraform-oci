locals {
  defaults = {}

  input = {
    compartment_id = var.compartment_id
    name           = var.name
    description    = var.description
    defined_tags   = var.defined_tags
    freeform_tags  = var.freeform_tags
    enable_delete  = var.enable_delete

    module_enabled = var.module_enabled
  }

  generated = {
    compartment_id = local.input.compartment_id
    name           = local.input.name
    description    = local.input.description
    defined_tags   = local.input.defined_tags
    freeform_tags  = local.input.freeform_tags
    enable_delete  = local.input.enable_delete

    module_enabled = local.input.module_enabled
  }

  outputs = {
    compartment_id = local.generated.compartment_id
    name           = local.generated.name
    description    = local.generated.description
    defined_tags   = local.generated.defined_tags
    freeform_tags  = local.generated.freeform_tags
    enable_delete  = local.generated.enable_delete

    module_enabled = local.generated.module_enabled
  }
}

resource "oci_identity_compartment" "this" {
  count = local.outputs.module_enabled ? 1 : 0

  compartment_id = local.outputs.compartment_id
  name           = local.outputs.name
  description    = local.outputs.description
  defined_tags   = local.outputs.defined_tags
  freeform_tags  = local.outputs.freeform_tags
  enable_delete  = local.outputs.enable_delete
}
