output "vcn_id" {
  description = "The OCID of the VCN"
  value       = local.outputs.module_enabled ? one(oci_core_vcn.this[*].id) : null
}

output "vcn_state" {
  description = "The state of the VCN"
  value       = local.outputs.module_enabled ? one(oci_core_vcn.this[*].state) : null
}

output "display_name" {
  description = "The display name of the VCN"
  value       = local.outputs.module_enabled ? one(oci_core_vcn.this[*].display_name) : null
}

output "cidr_blocks" {
  description = "The list of IPv4 CIDR blocks for the VCN"
  value       = local.outputs.module_enabled ? one(oci_core_vcn.this[*].cidr_blocks) : null
}

output "dns_label" {
  description = "The DNS label for the VCN"
  value       = local.outputs.module_enabled ? one(oci_core_vcn.this[*].dns_label) : null
}

output "default_dhcp_options_id" {
  description = "The OCID of the default DHCP options"
  value       = local.outputs.module_enabled ? one(oci_core_vcn.this[*].default_dhcp_options_id) : null
}

output "default_route_table_id" {
  description = "The OCID of the default route table"
  value       = local.outputs.module_enabled ? one(oci_core_vcn.this[*].default_route_table_id) : null
}

output "default_security_list_id" {
  description = "The OCID of the default security list"
  value       = local.outputs.module_enabled ? one(oci_core_vcn.this[*].default_security_list_id) : null
}

output "time_created" {
  description = "The time the VCN was created"
  value       = local.outputs.module_enabled ? one(oci_core_vcn.this[*].time_created) : null
}

output "module_enabled" {
  description = "Whether the module is enabled"
  value       = local.outputs.module_enabled
}
