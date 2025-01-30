variable "db_user" {}
variable "db_password" {}
variable "db" {}
variable "postgres_version" {}
variable "instance_class" {}

variable "subnet_ids" {
  type = list(string)
}

