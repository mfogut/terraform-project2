#############Private Subnet-A NAT #############################
resource "aws_eip" "nat_gateway_EIP_a" {
  vpc = true
}

resource "aws_nat_gateway" "public_subnet_a_nat" {
  allocation_id = aws_eip.nat_gateway_EIP_a.id
  subnet_id     = aws_subnet.public_subnet_a.id
  tags = {
    Name = "Public-Subnet-A-NAT"
  }
}

#############Private Subnet-B NAT #############################
resource "aws_eip" "nat_gateway_EIP_b" {
  vpc = true
}

resource "aws_nat_gateway" "public_subnet_b_nat" {
  allocation_id = aws_eip.nat_gateway_EIP_b.id
  subnet_id     = aws_subnet.public_subnet_b.id
  tags = {
    Name = "Public-Subnet-B-NAT"
  }
}

output "Nat-Gateway-EIP-A" {
  value       = aws_eip.nat_gateway_EIP_a.public_ip
  description = "Public Ip of NAT IGW"
}

output "Nat-Gateway-EIP-B" {
  value       = aws_eip.nat_gateway_EIP_b.public_ip
  description = "Public Ip of NAT IGW"
}
