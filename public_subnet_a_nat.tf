resource "aws_eip" "nat_gateway_EIP" {
  vpc = true
}

resource "aws_nat_gateway" "public_subnet_a_nat" {
  allocation_id = aws_eip.nat_gateway_EIP.id
  subnet_id     = aws_subnet.public_subnet_a.id
  tags = {
    Name = "Public-Subnet-A-NAT"
  }
}

output "Nat-Gateway-IP" {
  value       = aws_eip.nat_gateway_EIP.public_ip
  description = "Public Ip of NAT IGW"
}
