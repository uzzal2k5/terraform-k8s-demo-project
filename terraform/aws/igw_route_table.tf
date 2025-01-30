module "vpc" {
  source = "./modules/vpc"
}
module "igw" {
  source = "./modules/igw"
}
# Creating Route Table
resource "aws_route_table" "igw_route_table" {
  depends_on = [module.vpc,module.igw]
  vpc_id = module.vpc.vpc_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = module.igw
  }
  tags = {
    Name = "IGW Route Table"
  }
}


