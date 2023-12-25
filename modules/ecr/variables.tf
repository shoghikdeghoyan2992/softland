variable "repository_names" {
  description = "A map of repository names to create"
  type        = map(string)
}

variable "image_tag_mutability" {
  description = "Image tag mutability settings"
  type        = string
  default     = "MUTABLE"
}

variable "scan_on_push" {
  description = "Indicates whether images are scanned after being pushed to the repository"
  type        = bool
  default     = true
}
