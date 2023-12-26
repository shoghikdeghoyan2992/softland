# security_group.tf

module "app_security_group" {
  source         = "./modules/sg"
  vpc_id         = module.vpc.vpc_id
  sg_name        = "app-security-group"
  sg_description = "Security group for application servers"
  tags           = { "Name" = "app-security-group" }
}

module "app_sg_ingress_rule" {
  source            = "./modules/sg-rule-module"
  rule_type         = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = module.app_security_group.security_group_id
}
