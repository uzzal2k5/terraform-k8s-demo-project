variable "db_user" {}
variable "db_password" {}
variable "db" {}
variable "postgres_version" {}
variable "instance_class" {}

variable "subnet_ids" {
  type = list(string)
}
variable "vpc_id" {}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}
variable "private_subnets" {}