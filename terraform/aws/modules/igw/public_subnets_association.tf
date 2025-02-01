# Public Subnets Association with Route Table with Internet Gateway
resource "aws_route_table_association" "public_subnet_association" {
  for_each = toset(var.public_subnets)
  subnet_id     = each.value
  route_table_id = aws_route_table.igw_route_table.id
}


