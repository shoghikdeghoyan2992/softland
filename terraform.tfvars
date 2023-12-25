# terraform.tfvars

aws_region        = "us-east-1"
vpc_cidr          = "10.0.0.0/16"
number_of_subnets = 3
ecr_repository_names = {
  "repo1" = "repository-one",
  "repo2" = "repository-two"
}
cluster_name      = "my-eks-cluster"
cluster_version   = "1.21"
db_instance_class = "db.t3.medium"

