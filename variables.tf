# variables.tf

variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
   
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "number_of_subnets" {
  description = "The number of subnets to create"
  type        = number
}

# variable "subnet_ids" {
#   description = "List of subnet IDs"
#   type        = list(string)
# }

# variable "ecr_repository_name" {
#   description = "The name of the ECR repository"
#   type        = string
# }

variable "ecr_repository_names" {
  description = "A map of repository names to create"
  type        = map(string)
}

variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "cluster_version" {
  description = "Kubernetes version for the EKS cluster"
  type        = string
}

variable "db_instance_class" {
  description = "The database instance class"
  type        = string
}
