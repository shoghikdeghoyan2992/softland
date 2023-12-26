# module "eks" {
#   source  = "terraform-aws-modules/eks/aws"
#   version = "17.1.0"

#   cluster_name    = var.cluster_name
#   cluster_version = "1.21"
#   subnets      = [for subnet in module.subnets : subnet.subnet_id]
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
