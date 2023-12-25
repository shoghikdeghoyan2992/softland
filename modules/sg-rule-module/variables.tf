variable "rule_type" {
  description = "The type of the rule, either 'ingress' or 'egress'"
  type        = string
}

variable "from_port" {
  description = "The start port of the rule"
  type        = number
}

variable "to_port" {
  description = "The end port of the rule"
  type        = number
}

variable "protocol" {
  description = "The protocol of the rule"
  type        = string
}

variable "cidr_blocks" {
  description = "The CIDR blocks for the rule"
  type        = list(string)
}

variable "security_group_id" {
  description = "The ID of the security group to which the rule belongs"
  type        = string
}
