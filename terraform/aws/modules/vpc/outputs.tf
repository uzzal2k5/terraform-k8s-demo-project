output "aws_vpc" {
  description = "VPC"
  value       = aws_vpc.main
}
output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.main.id
}

output "public_subnets" {
  description = "List of public subnet IDs"
  value       = aws_subnet.public_subnets[*].id
}

output "private_subnets" {
  value = aws_subnet.private_subnets[*].id
}
# Output the Count of Available Zones
output "az_count" {
  value = length(data.aws_availability_zones.az.names)
}


output "public_subnet_ids" {
  value = [for subnet in aws_subnet.public_subnets : subnet.id]
}

output "public_subnet_cidrs" {
  value = [for subnet in aws_subnet.public_subnets : subnet.cidr_block]
}

output "private_subnet_ids" {
  value = [for subnet in aws_subnet.private_subnets : subnet.id]
}

output "private_subnet_cidrs" {
  value = [for subnet in aws_subnet.private_subnets : subnet.cidr_block]
}

output "availability_zones" {
  value = [for subnet in aws_subnet.private_subnets : subnet.availability_zone]
}

