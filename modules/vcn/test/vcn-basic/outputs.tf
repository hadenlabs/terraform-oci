output "vcn_id" {
  description = "ID of the created VCN"
  value       = module.vcn.vcn_id
}

output "display_name" {
  description = "Display name of the VCN"
  value       = module.vcn.display_name
}

output "cidr_blocks" {
  description = "CIDR blocks of the VCN"
  value       = module.vcn.cidr_blocks
}

output "dns_label" {
  description = "DNS label of the VCN"
  value       = module.vcn.dns_label
}

output "module_enabled" {
  description = "Whether the module was enabled"
  value       = module.vcn.module_enabled
}
