module "compute" {
  depends_on = [data.oci_core_images.ubuntu_2404_arm]
  source     = "../.."
  # Required variables
  compartment_id      = var.compartment_id
  availability_domain = var.availability_domain
  display_name        = var.display_name
  image_id            = data.oci_core_images.ubuntu_2404_arm.images[0].id
  ssh_public_key      = var.ssh_public_key
  subnet_id           = var.subnet_id

  # Optional variables
  shape                   = var.shape
  metadata                = var.metadata
  freeform_tags           = var.freeform_tags
  defined_tags            = var.defined_tags
  source_type             = var.source_type
  boot_volume_size_in_gbs = var.boot_volume_size_in_gbs

  # Module configuration
  module_enabled = var.module_enabled

}
