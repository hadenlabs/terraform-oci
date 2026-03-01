output "compartment_id" {
  description = "ID of the created compartment"
  value       = module.compartment.compartment_id
}

output "name" {
  description = "Name of the compartment"
  value       = module.compartment.name
}

output "description" {
  description = "Description of the compartment"
  value       = module.compartment.description
}

output "time_created" {
  description = "Time when the compartment was created"
  value       = module.compartment.time_created
}

output "state" {
  description = "State of the compartment"
  value       = module.compartment.state
}

output "is_accessible" {
  description = "Whether the compartment is accessible"
  value       = module.compartment.is_accessible
}

output "module_enabled" {
  description = "Whether the module was enabled"
  value       = module.compartment.module_enabled
}
