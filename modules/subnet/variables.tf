variable "vpc_id" {
  description = "The ID of the VPC for the subnet"
  type        = string
}

variable "subnet_cidr" {
  description = "The CIDR block of the subnet"
  type        = string
}

variable "subnet_name" {
  description = "The name of the subnet"
  type        = string
}

variable "map_public_ip" {
  description = "Flag to map public IP on launch in the subnet"
  type        = bool
}

variable "availability_zone" {
  description = "The availability zone in which to create the subnet"
  type        = string
}
