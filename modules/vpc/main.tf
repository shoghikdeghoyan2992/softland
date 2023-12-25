# VPC Creation
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = var.vpc_name
  }
}



# todo: include other resources like Internet Gateway, NAT Gateway, Route Tables, etc.
