# Output Elastic IP details
output "eip_id" {
  value = aws_eip.eip.id
}

output "eip_public_ip" {
  value = aws_eip.eip.public_ip
}

output "eip_tags" {
  value = aws_eip.eip.tags
}