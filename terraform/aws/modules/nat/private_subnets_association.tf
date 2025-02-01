# Private Subnets Association with Route Table with NAT Gateway
resource "aws_route_table_association" "private_subnet_association" {
  for_each = toset(var.private_subnets)
  subnet_id     = each.value
  route_table_id = aws_route_table.nat_gw_route_table.id
}
