output "subnet_id" {
  description = "ID of the created subnet"
  value       = module.subnet.subnet_id
}

output "display_name" {
  description = "Display name of the subnet"
  value       = module.subnet.display_name
}

output "cidr_block" {
  description = "CIDR block of the subnet"
  value       = module.subnet.cidr_block
}

output "availability_domain" {
  description = "Availability domain of the subnet"
  value       = module.subnet.availability_domain
}

output "route_table_id" {
  description = "Route table ID associated with the subnet"
  value       = module.subnet.route_table_id
}

output "security_list_ids" {
  description = "Security list IDs associated with the subnet"
  value       = module.subnet.security_list_ids
}

output "prohibit_public_ip_on_vnic" {
  description = "Whether public IP addresses are prohibited on VNICs in this subnet"
  value       = module.subnet.prohibit_public_ip_on_vnic
}

output "dns_label" {
  description = "DNS label of the subnet"
  value       = module.subnet.dns_label
}

output "virtual_router_ip" {
  description = "IP address of the virtual router for the subnet"
  value       = module.subnet.virtual_router_ip
}

output "virtual_router_mac" {
  description = "MAC address of the virtual router for the subnet"
  value       = module.subnet.virtual_router_mac
}

output "state" {
  description = "Current state of the subnet"
  value       = module.subnet.state
}

output "time_created" {
  description = "Date and time the subnet was created"
  value       = module.subnet.time_created
}

output "compartment_id" {
  description = "OCID of the compartment containing the subnet"
  value       = module.subnet.compartment_id
}

output "vcn_id" {
  description = "OCID of the VCN containing the subnet"
  value       = module.subnet.vcn_id
}

output "defined_tags" {
  description = "Defined tags of the subnet"
  value       = module.subnet.defined_tags
}

output "freeform_tags" {
  description = "Freeform tags of the subnet"
  value       = module.subnet.freeform_tags
}

output "module_enabled" {
  description = "Whether the module was enabled"
  value       = module.subnet.module_enabled
}
