# Create Public Subnets
resource "aws_subnet" "public_subnets" {
  depends_on = [aws_vpc.main]
  count = length(data.aws_availability_zones.az.names)
  vpc_id                  = aws_vpc.main.id
  # Dynamically generate public subnet CIDR blocks from VPC CIDR (First Half)
  cidr_block = cidrsubnet(var.vpc_cidr, 4, count.index)

  # Assign public subnets to different AZs
  availability_zone       = data.aws_availability_zones.az.names[count.index]
  map_public_ip_on_launch = true  # Enable public IP for instances

  tags = {
    Name = "public-subnet-${count.index+1}"
  }
}

# Create Private Subnets
resource "aws_subnet" "private_subnets" {
  depends_on = [aws_vpc.main]
  count = length(data.aws_availability_zones.az.names)
  vpc_id = aws_vpc.main.id
  # Dynamically generate private subnet CIDR blocks from a separate block of VPC CIDR (Second Half)
  cidr_block = cidrsubnet(var.vpc_cidr, 4, count.index + length(data.aws_availability_zones.az.names))

  # Assign private subnets to different AZs
  availability_zone = data.aws_availability_zones.az.names[count.index]
  tags = {
    Name = "private-subnet-${count.index+1}"
  }
}
