variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnets_cidrs" {
  description = "List of CIDR blocks for public subnets"
  type        = list(string)
}


variable "private_subnets_cidr" {
  description = "Private Subnet CIDR values"
  type = list(string)

}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
}
