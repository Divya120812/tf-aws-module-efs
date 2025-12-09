resource "aws_security_group" "efs" {      # creates new sg for efs
  name        = "${var.name}-efs-sg"
  description = "Security group for EFS"
  vpc_id      = var.vpc_id

  # Inbound NFS from specified SGs (to share files/directories through network)
  ingress {
    description     = "NFS from allowed security groups"
    from_port       = 2049
    to_port         = 2049
    protocol        = "tcp"
    security_groups = var.allowed_security_group_ids
  }

  # EFS doesn’t initiate outbound, but allow all egress by default
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    var.tags,
    {
      Name = "${var.name}-efs-sg"
    }
  )
}

resource "aws_efs_file_system" "this-efs" {
  creation_token   = var.name
  performance_mode = var.performance_mode
  throughput_mode  = var.throughput_mode
  encrypted        = var.encrypted

  tags = merge(
    var.tags,
    {
      Name = var.name
    }
  )
}

# Create one mount target per subnet  
# EC2 instances mount EFS through mount targets in their Availability Zone.
# AWS requires at least one mount target per AZ where EC2 instances will access EFS.
# If you have multiple subnets (one per AZ), Terraform creates a mount target in each.
# EC2 instances in those subnets can mount EFS without cross-AZ traffic.

resource "aws_efs_mount_target" "this-mount" {
  for_each = toset(var.subnet_ids)  # creating one mount target per subnet

  file_system_id  = aws_efs_file_system.this-efs.id
  subnet_id       = each.value
  security_groups = [aws_security_group.efs.id]
}