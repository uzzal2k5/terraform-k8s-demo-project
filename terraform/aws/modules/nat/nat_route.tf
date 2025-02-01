resource "aws_route_table" "nat_gw_route_table" {
  vpc_id = var.vpc_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat-gateway[0].id
  }
  tags = {
    Name = "Nat Gateway Route Table"
  }
}
