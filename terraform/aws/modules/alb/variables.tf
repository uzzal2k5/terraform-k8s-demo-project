variable "vpc_id" {
  description = "VPC ID for the ALB"
  type        = string
}

variable "public_subnets" {
  description = "List of public subnets for the ALB"
  type        = list(string)
}

variable "private_subnets" {
  description = "List of private subnets for internal ALB"
  type        = list(string)
}

variable "internal" {
  description = "Boolean to define if the ALB is internal"
  type        = bool
  default     = false
}
