module "vpc" {
  source = "./modules/vpc"
}
resource "aws_eip" "eip" {
  vpc      = true
  depends_on = module.vpc
  tags = {
    Name = "NAT Gateway EIP"
  }
}