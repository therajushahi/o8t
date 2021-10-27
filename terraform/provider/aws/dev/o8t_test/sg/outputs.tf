# SG ID
output "sg_id" {
  description = "The ID of the sg"
  value       = module.web_server_sg.security_group_id
}
