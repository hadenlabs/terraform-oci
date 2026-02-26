locals {
  defaults = {}

  input = {
    compartment_id          = var.compartment_id
    availability_domain     = var.availability_domain
    shape                   = var.shape
    subnet_id               = var.subnet_id
    display_name            = var.display_name
    image_id                = var.image_id
    ssh_public_key          = var.ssh_public_key
    metadata                = var.metadata
    freeform_tags           = var.freeform_tags
    defined_tags            = var.defined_tags
    source_type             = var.source_type
    boot_volume_size_in_gbs = var.boot_volume_size_in_gbs

    module_enabled = var.module_enabled
  }

  generated = {
    compartment_id          = local.input.compartment_id
    availability_domain     = local.input.availability_domain
    shape                   = local.input.shape
    subnet_id               = local.input.subnet_id
    display_name            = local.input.display_name
    image_id                = local.input.image_id
    ssh_public_key          = local.input.ssh_public_key
    metadata                = local.input.metadata
    freeform_tags           = local.input.freeform_tags
    defined_tags            = local.input.defined_tags
    source_type             = local.input.source_type
    boot_volume_size_in_gbs = local.input.boot_volume_size_in_gbs

    module_enabled = local.input.module_enabled
  }

  outputs = {
    compartment_id          = local.generated.compartment_id
    availability_domain     = local.generated.availability_domain
    shape                   = local.generated.shape
    subnet_id               = local.generated.subnet_id
    display_name            = local.generated.display_name
    image_id                = local.generated.image_id
    ssh_public_key          = local.generated.ssh_public_key
    metadata                = local.generated.metadata
    freeform_tags           = local.generated.freeform_tags
    defined_tags            = local.generated.defined_tags
    source_type             = local.generated.source_type
    boot_volume_size_in_gbs = local.generated.boot_volume_size_in_gbs

    module_enabled = local.generated.module_enabled
  }
}

resource "oci_core_instance" "this" {
  count = local.outputs.module_enabled ? 1 : 0

  compartment_id      = local.outputs.compartment_id
  availability_domain = local.outputs.availability_domain
  shape               = local.outputs.shape
  display_name        = local.outputs.display_name

  source_details {
    source_id               = local.outputs.image_id
    source_type             = local.outputs.source_type
    boot_volume_size_in_gbs = local.outputs.boot_volume_size_in_gbs
  }

  metadata = {
    ssh_authorized_keys = local.outputs.ssh_public_key
  }

  freeform_tags = local.outputs.freeform_tags
  defined_tags  = local.outputs.defined_tags

  create_vnic_details {
    subnet_id = local.outputs.subnet_id
  }
}
