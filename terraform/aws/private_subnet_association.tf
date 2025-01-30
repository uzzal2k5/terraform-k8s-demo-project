# Private Subnets Association with Route Table with NAT Gateway
resource "aws_route_table_association" "private_subnet_association" {
  depends_on = [aws_nat_gateway.nat-gateway]
  count = length(var.private_subnets_cidr)
  subnet_id = element(aws_subnet.private_subnets[*].id,count.index)
  route_table_id = aws_route_table.nat_gw_route_table.id
}

