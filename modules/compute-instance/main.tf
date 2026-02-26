locals {
  defaults = {}

  input = {

    availability_domain = var.availability_domain
    compartment_id      = var.compartment_ocid
    shape               = var.shape
    subnet_id           = var.subnet_ocid
    display_name        = "minimal-instance"


    # module
    module_enabled = var.module_enabled
  }

  generated = {

    # module
    module_enabled = local.input.module_enabled
  }

  outputs = {
    # module
    module_enabled = local.generated.module_enabled
  }

}

resource "oci_core_instance" "this" {
  count               = local.outputs.module_enabled ? 1 : 0
  availability_domain = var.availability_domain
  compartment_id      = var.compartment_ocid
  shape               = var.shape
  subnet_id           = var.subnet_ocid
  display_name        = "minimal-instance"

  create_vnic_details {
    assign_public_ip = true
    subnet_id        = var.subnet_ocid
  }

  metadata = {
    ssh_authorized_keys = var.ssh_public_key
  }

  source_details {
    source_type = "image"
    source_id   = var.image_ocid
  }
}