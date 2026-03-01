output "compartment_id" {
  description = "The OCID of the compartment"
  value       = local.outputs.module_enabled ? one(oci_identity_compartment.this[*].id) : null
}

output "name" {
  description = "The name of the compartment"
  value       = local.outputs.module_enabled ? one(oci_identity_compartment.this[*].name) : null
}

output "description" {
  description = "The description of the compartment"
  value       = local.outputs.module_enabled ? one(oci_identity_compartment.this[*].description) : null
}

output "time_created" {
  description = "The time the compartment was created"
  value       = local.outputs.module_enabled ? one(oci_identity_compartment.this[*].time_created) : null
}

output "state" {
  description = "The state of the compartment"
  value       = local.outputs.module_enabled ? one(oci_identity_compartment.this[*].state) : null
}

output "is_accessible" {
  description = "Whether the compartment is accessible"
  value       = local.outputs.module_enabled ? one(oci_identity_compartment.this[*].is_accessible) : null
}

output "defined_tags" {
  description = "The defined tags of the compartment"
  value       = local.outputs.module_enabled ? one(oci_identity_compartment.this[*].defined_tags) : null
}

output "freeform_tags" {
  description = "The freeform tags of the compartment"
  value       = local.outputs.module_enabled ? one(oci_identity_compartment.this[*].freeform_tags) : null
}

output "enable_delete" {
  description = "Whether the compartment can be deleted"
  value       = local.outputs.module_enabled ? one(oci_identity_compartment.this[*].enable_delete) : null
}

output "module_enabled" {
  description = "Whether the module is enabled"
  value       = local.outputs.module_enabled
}
