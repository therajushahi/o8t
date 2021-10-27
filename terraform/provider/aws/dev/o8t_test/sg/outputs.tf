# SG ID
output "web_server_sg" {
  description = "The ID of the web-server"
  value       = module.web_server_sg.security_group_id
}

output "ssh_sg" {
  description = "The ID of the ssh sg"
  value       = module.ssh_sg.security_group_id
}
