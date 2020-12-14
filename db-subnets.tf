resource "aws_subnet" "db_subnet_a" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.db_subnet_cidr_block[0]
  availability_zone       = local.az_names[0]
  map_public_ip_on_launch = false
  tags = {
    Name = "DB-Subnet-A"
  }
}

resource "aws_subnet" "db_subnet_b" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.db_subnet_cidr_block[1]
  availability_zone       = local.az_names[1]
  map_public_ip_on_launch = false
  tags = {
    Name = "DB-Subnet-B"
  }
}

output "DB-Subnet-A-Cidr_Block" {
  value       = aws_subnet.db_subnet_a.cidr_block
  description = "CidrBlock for DB-Subnet-A"
}


output "DB-Subnet-B-Cidr_Block" {
  value       = aws_subnet.db_subnet_b.cidr_block
  description = "CidrBlock for DB-Subnet-B"
}
