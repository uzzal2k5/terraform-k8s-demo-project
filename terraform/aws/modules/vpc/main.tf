resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "multi-zone-3-tier-vpc"
  }
}

resource "aws_subnet" "public_subnet" {
  depends_on = [aws_vpc.main]
#  count                   = 3
  count = length(data.aws_availability_zones.az.names)
  vpc_id                  = aws_vpc.main.id
  cidr_block = element(var.public_subnets_cidrs,count.index)
  availability_zone = element(data.aws_availability_zones.az.names,count.index)
  map_public_ip_on_launch = true
  tags = {
    Name = "public-subnet-${count.index+1}"
  }
}

resource "aws_subnet" "private_subnet" {
  depends_on = [aws_vpc.main]
  count = length(data.aws_availability_zones.az.names)
  vpc_id = aws_vpc.main.id
  cidr_block = element(var.private_subnets_cidr,count.index)
  availability_zone = element(data.aws_availability_zones.az.names,count.index)
  map_public_ip_on_launch = "true"
  tags = {
    Name = "private-subnet-${count.index+1}"
  }
}


# Creating Security Group
resource "aws_security_group" "main_vpc_sg" {
  depends_on = [aws_vpc.main]
  name        = "VPC Security Group"
  description = "VPC Security Group"
  vpc_id      = aws_vpc.main.id
  # Inbound Rules
  # HTTP access from anywhere
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # HTTPS access from anywhere
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # SSH access from anywhere
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # Outbound Rules
  # Internet access to anywhere
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
