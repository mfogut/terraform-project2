#Public Subnets for My_Vpc
resource "aws_subnet" "public_subnet_a" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.public_subnet_cidr_block[0]
  availability_zone       = local.az_names[0]
  map_public_ip_on_launch = true
  tags = {
    Name = "Public-Subnet-A"
  }
}

resource "aws_subnet" "public_subnet_b" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.public_subnet_cidr_block[1]
  availability_zone       = local.az_names[1]
  map_public_ip_on_launch = true
  tags = {
    Name = "Public-Subnet-B"
  }
}


output "Public-Subnet-A-Cidr_Block" {
  value       = aws_subnet.public_subnet_a.cidr_block
  description = "CidrBlock for Public-Subnet-A"
}


output "Public-Subnet-B-Cidr_Block" {
  value       = aws_subnet.public_subnet_b.cidr_block
  description = "CidrBlock for Public-Subnet-B"
}
