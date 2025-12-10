# variable "aws_region" {
#   description = "AWS region"
#   type        = string
#   default     = "eu-west-2"
# } 

variable "project_name" {
  description = "Project name"
  type        = string
}

variable "environment" {
  description = "Environment name (e.g., dev, prod)"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where EFS will be created"
  type        = string
}

variable "private_subnet_ids" {
  description = "Private subnet IDs for EFS mount targets"
  type        = list(string)
}

variable "app_sg_ids" {
  description = "Security group IDs of instances/containers that will mount EFS"
  type        = list(string)
}

# variable "region" {
# description = "AWS region"
# type        = string
# }

# variable "access_key" {
#  description = "AWS access key"
#  type        = string  
# sensitive = true  
# }

# variable "secret_key " {
# description = "AWS secret key"
# type        = string              
# sensitive = true
# }

  
