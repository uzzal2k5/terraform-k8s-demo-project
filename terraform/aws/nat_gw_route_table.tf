resource "aws_route_table" "nat_gw_route_table" {
  depends_on = [aws_vpc.thkee_vpc,aws_nat_gateway.nat-gateway]
  vpc_id = aws_vpc.thkee_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat-gateway[0].id
  }
  tags = {
    Project = "Thkee"
    Name = "Nat Gateway Route Table"
  }
}

