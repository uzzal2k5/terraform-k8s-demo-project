resource "aws_nat_gateway" "nat-gateway" {
  depends_on = [aws_internet_gateway.thkee_igw,aws_eip.eip]
  allocation_id = aws_eip.eip.id
  # count = length(aws_subnet.public_subnets)
  count = 1
  subnet_id = aws_subnet.public_subnets[0].id
  tags = {
    Project = "Thkee"
    Name = "thkee_nat_gateway"
  }
}