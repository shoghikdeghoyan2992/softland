variable "dbstorage" {
  description = "The allocated storage in gigabytes"
  type        = number
}

variable "identifier" {
  description = "The name of the RDS instance"
  type        = string
}

variable "engine" {
  description = "The database engine to use"
  default     = "mysql"
  type        = string
}

variable "engine_version" {
  description = "The engine version to use"
  default     = "8.0.28"
  type        = string
}

variable "instance_class" {
  description = "The instance type of the RDS instance"
  default     = "db.t2.micro"
  type        = string
}

variable "username" {
  description = "Username for the database"
  type        = string
}

variable "password" {
  description = "Password for the database"
  type        = string
}

variable "publicly_accessible" {
  description = "Boolean to control if instance is publicly accessible"
  default     = true
  type        = bool
}

variable "skip_final_snapshot" {
  description = "Determines whether a final DB snapshot is created before the DB instance is deleted"
  default     = true
  type        = bool
}

variable "name_tag" {
  description = "The name tag of the RDS instance"
  default     = "MyRDS"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs"
  type        = list(string)
}

variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "app_security_group_id" {
  description = "ID of the application security group"
  type        = string
}