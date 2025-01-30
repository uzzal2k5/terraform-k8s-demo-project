module "vpc" {
  source = "./modules/vpc"
}

resource "aws_internet_gateway" "igw" {
  depends_on = [module.vpc]
  vpc_id = module.vpc.vpc_id
  tags = {
    Name = "Internet Gateway"
  }
}

