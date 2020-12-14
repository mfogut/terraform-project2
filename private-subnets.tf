resource "aws_subnet" "private_subnet_a" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.private_subnet_cidr_block[0]
  availability_zone       = local.az_names[0]
  map_public_ip_on_launch = false
  tags = {
    Name = "Private-Subnet-A"
  }
}

resource "aws_subnet" "private_subnet_b" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.private_subnet_cidr_block[1]
  availability_zone       = local.az_names[1]
  map_public_ip_on_launch = false
  tags = {
    Name = "Private-Subnet-B"
  }
}

output "Private-Subnet-A-Cidr_Block" {
  value       = aws_subnet.private_subnet_a.cidr_block
  description = "CidrBlock for Private-Subnet-A"
}


output "Private-Subnet-B-Cidr_Block" {
  value       = aws_subnet.private_subnet_b.cidr_block
  description = "CidrBlock for Private-Subnet-B"
}
