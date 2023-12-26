# rds.tf

data "aws_ssm_parameter" "db_password" {
  name = "/MyDbPassword"
}

module "rds_instance" {
  source                = "./modules/rds"
  vpc_id                = module.vpc.vpc_id
  dbstorage             = 20
  identifier            = "my-rds-instance"
  username              = "admin"
  password              = data.aws_ssm_parameter.db_password.value
  subnet_ids            = [for subnet in module.subnets : subnet.subnet_id]
  app_security_group_id = module.app_security_group.security_group_id
  publicly_accessible   = false
  multi_az              = true
  skip_final_snapshot   = true
}
