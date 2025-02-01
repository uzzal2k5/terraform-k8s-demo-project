resource "aws_nat_gateway" "nat-gateway" {
#  depends_on = [module.igw.igw_id,aws_eip.eip]
  allocation_id = aws_eip.eip.id
  for_each = toset(var.public_subnets)
  subnet_id     = each.value
  tags = {
    Name = "nat_gateway"
  }
}
