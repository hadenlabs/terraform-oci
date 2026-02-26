output "instance_id" {
  description = "The OCID of the instance"
  value       = local.outputs.module_enabled ? one(oci_core_instance.this[*].id) : null
}

output "instance_state" {
  description = "The state of the instance"
  value       = local.outputs.module_enabled ? one(oci_core_instance.this[*].state) : null
}

output "display_name" {
  description = "The display name of the instance"
  value       = local.outputs.module_enabled ? one(oci_core_instance.this[*].display_name) : null
}

output "shape" {
  description = "The shape of the instance"
  value       = local.outputs.module_enabled ? one(oci_core_instance.this[*].shape) : null
}

output "time_created" {
  description = "The time the instance was created"
  value       = local.outputs.module_enabled ? one(oci_core_instance.this[*].time_created) : null
}

output "private_ip" {
  description = "The private IP of the instance"
  value       = local.outputs.module_enabled ? one(oci_core_instance.this[*].private_ip) : null
}

output "public_ip" {
  description = "The public IP of the instance"
  value       = local.outputs.module_enabled ? one(oci_core_instance.this[*].public_ip) : null
}
