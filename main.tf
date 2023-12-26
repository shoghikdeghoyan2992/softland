
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

# terraform {
#   backend "s3" {
#     bucket         = "Myproject" 
#     key            = "state/terraform.tfstate"  
#     region         = "us-east-1"  
#     dynamodb_table = "my-terraform-lock-table"  
#   }
# }


locals {
  common_tags = {
    Project = "MyProject"
  }
}
