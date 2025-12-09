module "efs" {
  source = "/EFS/module"

  name                     = "${var.project_name}-${var.environment}-efs"
  vpc_id                   = var.vpc_id
  subnet_ids               = var.private_subnet_ids
  allowed_security_group_ids = var.app_sg_ids

  performance_mode = "generalPurpose"
  throughput_mode  = "bursting"  #default mode scales automatically with the size of your file system.
  encrypted        = true

  tags = {
    Project     = var.project_name
    Environment = var.environment
  }
}