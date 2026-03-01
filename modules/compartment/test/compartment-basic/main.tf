module "compartment" {
  source = "../.."

  # Required variables
  compartment_id = var.compartment_id
  name           = var.name
  description    = var.description

  # Optional variables
  enable_delete = var.enable_delete
  freeform_tags = var.freeform_tags
  defined_tags  = var.defined_tags

  # Module configuration
  module_enabled = var.module_enabled
}
