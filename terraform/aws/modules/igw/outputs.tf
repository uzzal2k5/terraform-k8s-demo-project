# Output Internet Gateway ID and VPC ID
output "igw_id" {
  value = aws_internet_gateway.igw.id
}

output "igw_vpc_id" {
  value = aws_internet_gateway.igw.vpc_id
}

output "igw_tags" {
  value = aws_internet_gateway.igw.tags
}

output "route_table_id" {
  value = aws_route_table.igw_route_table.id
}
