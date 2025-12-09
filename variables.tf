variable "name" {
  description = "Name prefix for the EFS file system"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where EFS will be created"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs to create EFS mount targets in"
  type        = list(string)
}

variable "allowed_security_group_ids" {
  description = "Security groups that can access EFS (NFS port 2049)"
  type        = list(string)
}

variable "performance_mode" {
  description = "EFS performance mode"
  type        = string
  default     = "generalPurpose"
}

variable "throughput_mode" {
  description = "EFS throughput mode"
  type        = string
  default     = "bursting"
}

variable "encrypted" {
  description = "Whether EFS is encrypted"
  type        = bool
  default     = true
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}