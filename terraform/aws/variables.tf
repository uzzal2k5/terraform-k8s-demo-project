variable "region" {
  default = "us-east-1"
}
# VPC Related Variables
variable "vpc_name" {
  default = "3-tier-app"
}

variable "vpc_cidr" {
  default = "192.168.0.0/16"
}


# Database Related Variables
variable "db" {
  default = "counterdb"
}

variable "db_user" {
  default = "admin"
}

variable "db_password" {
  default = "securepassword"
}

variable "postgres_version" {
  default = "14.5"
}
variable "instance_class" {
  default = "db.t3.micro"
}

# EKS Related Cluster

variable "cluster_name" {
  default = "eks-cluster"
}

variable "cluster_version" {
  default = "1.26"
}


# Docker Container App
variable "ecr_repositories" {
  default = ["backend", "frontend"]
}
