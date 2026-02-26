output "id" {
  description = "id of module"
  value       = module.main.id
}

output "rule_id" {
  description = "The ID of the email routing rule (if created)."
  value       = module.main.rule_id
}

output "address_id" {
  description = "The ID of the destination email routing address (if created)."
  value       = module.main.address_id
}
