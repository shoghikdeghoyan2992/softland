variable "cluster_id" {
  description = "The name of the ElastiCache cluster"
  type        = string
}

variable "node_type" {
  description = "The node type for the Redis cluster"
  type        = string
}

variable "num_cache_nodes" {
  description = "The number of cache nodes"
  type        = number
}

variable "parameter_group_name" {
  description = "The name of the parameter group"
  type        = string
}

variable "engine_version" {
  description = "The version of the Redis engine"
  type        = string
}

variable "subnet_ids" {
  description = "A list of VPC subnet IDs for the Redis cluster"
  type        = list(string)
}

variable "security_group_id" {
  description = "The ID of the VPC security group"
  type        = string
}

variable "tags" {
  description = "A map of tags to add to the Redis cluster"
  type        = map(string)
  default     = {}
}
