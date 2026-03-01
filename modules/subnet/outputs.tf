#
# ----------------------------------------------------------------------------------------------------------------------
# OUTPUTS
# These outputs are exported for use by other modules.
# ----------------------------------------------------------------------------------------------------------------------

output "subnet_id" {
  description = "The OCID of the created subnet"
  value       = try(oci_core_subnet.this[0].id, null)
}

output "display_name" {
  description = "The display name of the subnet"
  value       = try(oci_core_subnet.this[0].display_name, null)
}

output "cidr_block" {
  description = "The CIDR block of the subnet"
  value       = try(oci_core_subnet.this[0].cidr_block, null)
}

output "availability_domain" {
  description = "The availability domain of the subnet"
  value       = try(oci_core_subnet.this[0].availability_domain, null)
}

output "route_table_id" {
  description = "The OCID of the route table associated with the subnet"
  value       = try(oci_core_subnet.this[0].route_table_id, null)
}

output "security_list_ids" {
  description = "List of security list OCIDs associated with the subnet"
  value       = try(oci_core_subnet.this[0].security_list_ids, [])
}

# network_security_group_ids is not supported in oci_core_subnet resource
# Use oci_core_network_security_group resource instead

output "prohibit_public_ip_on_vnic" {
  description = "Whether public IP addresses are prohibited on VNICs in this subnet"
  value       = try(oci_core_subnet.this[0].prohibit_public_ip_on_vnic, null)
}

output "dns_label" {
  description = "The DNS label of the subnet"
  value       = try(oci_core_subnet.this[0].dns_label, null)
}

output "virtual_router_ip" {
  description = "The IP address of the virtual router for the subnet"
  value       = try(oci_core_subnet.this[0].virtual_router_ip, null)
}

output "virtual_router_mac" {
  description = "The MAC address of the virtual router for the subnet"
  value       = try(oci_core_subnet.this[0].virtual_router_mac, null)
}

output "state" {
  description = "The current state of the subnet"
  value       = try(oci_core_subnet.this[0].state, null)
}

output "time_created" {
  description = "The date and time the subnet was created"
  value       = try(oci_core_subnet.this[0].time_created, null)
}

output "compartment_id" {
  description = "The OCID of the compartment containing the subnet"
  value       = try(oci_core_subnet.this[0].compartment_id, null)
}

output "vcn_id" {
  description = "The OCID of the VCN containing the subnet"
  value       = try(oci_core_subnet.this[0].vcn_id, null)
}

output "defined_tags" {
  description = "The defined tags of the subnet"
  value       = try(oci_core_subnet.this[0].defined_tags, {})
}

output "freeform_tags" {
  description = "The freeform tags of the subnet"
  value       = try(oci_core_subnet.this[0].freeform_tags, {})
}

# ----------------------------------------------------------------------------------------------------------------------
# MODULE CONFIGURATION OUTPUTS
# These outputs are used to configure the module.
# ----------------------------------------------------------------------------------------------------------------------

output "module_enabled" {
  value       = var.module_enabled
  description = "(Optional) Whether to create resources within the module or not. Default is true."
}
