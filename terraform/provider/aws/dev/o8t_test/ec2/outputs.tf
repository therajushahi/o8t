# Web
output "public_id_web" {
  description = "The ip of public instance"
  value       = module.ec2_instance["web-server"].public_ip
}

# Health
output "public_id_health" {
  description = "The ip of public instance"
  value       = module.ec2_instance["health-check"].public_ip
}
