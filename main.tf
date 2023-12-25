locals {
  subnet_cidrs = [for i in range(var.number_of_subnets) : cidrsubnet(var.vpc_cidr, 8, i)]
}

module "vpc" {
  source   = "./modules/vpc"
  vpc_cidr = var.vpc_cidr
  vpc_name = "main-vpc"
}

# resource "aws_subnet" "subnets" {
#   count                   = var.number_of_subnets
#   vpc_id                  = module.vpc.vpc_id
#   cidr_block              = local.subnet_cidrs[count.index]
#   availability_zone       = data.aws_availability_zones.available.names[count.index % length(data.aws_availability_zones.available.names)]
#   map_public_ip_on_launch = false

#   tags = {
#     Name = "subnet-${count.index}"
#   }
# }

module "subnets" {
  source = "./modules/subnet"
  for_each = { for idx, cidr in local.subnet_cidrs : idx => {
    subnet_cidr       = cidr
    availability_zone = data.aws_availability_zones.available.names[idx]
    subnet_name       = "subnet-${idx}"
    map_public_ip     = false
  } }

  vpc_id            = module.vpc.vpc_id
  subnet_cidr       = each.value["subnet_cidr"]
  availability_zone = each.value["availability_zone"]
  subnet_name       = each.value["subnet_name"]
  map_public_ip     = each.value["map_public_ip"]
}


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
  skip_final_snapshot   = true
}

module "eks_cluster_role" {
  source = "./modules/iam-role"

  role_name                      = "eks_cluster_role"
  assume_role_service_principals = ["eks.amazonaws.com"]
  policy_arn                     = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  tags                           = { "Purpose" = "EKS Cluster" }
}

module "eks_node_group_role" {
  source = "./modules/iam-role"

  role_name                      = "eks_node_group_role"
  assume_role_service_principals = ["ec2.amazonaws.com"]
  policy_arn                     = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  tags                           = { "Purpose" = "EKS Node Group" }
}

# module "eks" {
#   source  = "terraform-aws-modules/eks/aws"
#   version = "17.1.0"

#   cluster_name    = var.cluster_name
#   cluster_version = "1.21"
#   subnet_ids      = module.subnet.subnet_ids
#   vpc_id          = module.vpc.vpc_id

#   cluster_iam_role_name = module.eks_cluster_role.role_name

#   worker_groups = [
#     {
#       instance_type = "m4.large"
#       asg_max_size  = 5
#       iam_role_arn  = module.eks_node_group_role.role_name
#     }
#   ]
# }


module "ecr" {
  source           = "./modules/ecr"
  repository_names = var.ecr_repository_names
}


module "mq" {
  source = "./modules/mq"
  # mq_instance_type = var.mq_instance_type
  // ... other MQ configurations
}
