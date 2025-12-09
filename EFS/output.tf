output "efs_id" {
  description = "EFS file system ID"
  value       = module.efs.efs_id
}

output "efs_arn" {
  description = "EFS ARN"
  value       = module.efs.efs_arn
}

output "efs_dns_name" {
  description = "EFS DNS name"
  value       = module.efs.efs_dns_name
}

output "efs_security_group_id" {
  description = "EFS security group ID"
  value       = module.efs.security_group_id
}