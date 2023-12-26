locals {
  subnet_cidrs = [for i in range(var.number_of_subnets) : cidrsubnet(var.vpc_cidr, 8, i)]
}

module "vpc" {
  source   = "./modules/vpc"
  vpc_cidr = var.vpc_cidr
  vpc_name = "main-vpc"
}

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
