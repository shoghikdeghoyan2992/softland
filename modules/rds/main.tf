module "rds_security_group" {
  source          = "../sg"
  vpc_id          = var.vpc_id  
  sg_name         = "rds-security-group"
  sg_description  = "Security group for RDS instance"
 
  tags = {
    Name = "rds-security-group"
  }
}

module "rds_sg_ingress" {
  source            = "../sg-rule-module"
  rule_type         = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  security_group_id = module.rds_security_group.security_group_id
  cidr_blocks       = ["0.0.0.0/0"]  # Update with appropriate CIDR block
}

module "rds_sg_egress" {
  source            = "../sg-rule-module"
  rule_type         = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  security_group_id = module.rds_security_group.security_group_id
  cidr_blocks       = ["0.0.0.0/0"]
}


resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "my-rds-subnet-group"
  subnet_ids = var.subnet_ids

  tags = {
    Name = "My DB Subnet Group"
  }
}

resource "aws_db_instance" "myrds" {
  allocated_storage    = var.dbstorage
  storage_type         = "gp2"
  identifier           = var.identifier
  engine               = "mysql"
  engine_version       = var.engine_version
  instance_class       = var.instance_class
  username             = var.username
  password             = var.password
  vpc_security_group_ids = [module.rds_security_group.security_group_id]
  db_subnet_group_name = aws_db_subnet_group.rds_subnet_group.name
  publicly_accessible  = var.publicly_accessible
  skip_final_snapshot  = var.skip_final_snapshot

  tags = {
    Name = var.name_tag
  }
}