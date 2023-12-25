variable "role_name" {
  description = "The name of the IAM role"
  type        = string
}

variable "assume_role_service_principals" {
  description = "Service principals that can assume this role"
  type        = list(string)
}

variable "policy_arn" {
  description = "The ARN of the policy to attach to the role"
  type        = string
}

variable "tags" {
  description = "A map of tags to add to the role"
  type        = map(string)
  default     = {}
}
