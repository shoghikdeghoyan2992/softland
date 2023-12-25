variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "sg_name" {
  description = "The name of the security group"
  type        = string
}

variable "sg_description" {
  description = "The description of the security group"
  type        = string
}

variable "tags" {
  description = "A map of tags to add to the security group"
  type        = map(string)
  default     = {}
}
