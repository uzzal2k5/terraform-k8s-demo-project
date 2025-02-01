resource "aws_eip" "eip" {
  vpc      = true
  tags = {
    Name = "NAT Gateway EIP"
  }
}