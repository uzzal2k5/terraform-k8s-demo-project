#data "aws_availability_zones" "available" {}
#
#data "aws_eks_cluster" "cluster" {
#  name = module.eks.cluster_id
#}
#
#data "aws_eks_cluster_auth" "cluster" {
#  name = module.eks.cluster_id
#}
#
#locals {
#  cluster_name = "learnk8s"
#}


variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "region" {
  default = "us-east-1"
}
# VPC
variable "vpc_cidr" {
  default = "192.168.0.0/16"
}

variable "private_subnets_cidr" {
  description = "Private Subnet CIDR values"
  type = list(string)
  default = ["192.168.1.0/24","192.168.2.0/24","192.168.3.0/24"]
}

variable "public_subnets_cidr" {
  description = "Public Subnet CIDR values"
  type = list(string)
  default = ["192.168.10.0/24","192.168.11.0/24","192.168.12.0/24"]
}


# Database Variables
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

# EKS Cluster

variable "cluster_name" {
  default = "eks-cluster"
}

variable "cluster_version" {
  default = "1.26"
}
