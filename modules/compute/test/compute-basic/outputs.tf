output "instance_id" {
  description = "ID of the created compute instance"
  value       = module.compute.instance_id
}

output "instance_state" {
  description = "State of the compute instance"
  value       = module.compute.instance_state
}

output "display_name" {
  description = "Display name of the compute instance"
  value       = module.compute.display_name
}

output "private_ip" {
  description = "Private IP of the compute instance"
  value       = module.compute.private_ip
}

output "public_ip" {
  description = "Public IP of the compute instance"
  value       = module.compute.public_ip
}

output "module_enabled" {
  description = "Whether the module was enabled"
  value       = module.compute.module_enabled
}
