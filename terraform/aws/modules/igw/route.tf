module "vpc" {
  source = "./modules/vpc"
}

#Creating Route Table
resource "aws_route_table" "igw_route_table" {
  depends_on = module.vpc.main
  vpc_id = module.vpc.vpc_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw[0].id
  }
  tags = {
    Name = "Route to internet"
  }
}



