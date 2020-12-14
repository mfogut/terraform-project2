resource "aws_internet_gateway" "my_vpc_igw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "MY-VPC-IGW"
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Name = "Public-Subnet-RT"
  }
}

#Route table route for "public_rt"
resource "aws_route" "public_rt_route" {
  route_table_id         = aws_route_table.public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.my_vpc_igw.id
}

#Route table Subnet Association for "public_rt"
resource "aws_route_table_association" "public_subnet_a_association" {
  subnet_id      = aws_subnet.public_subnet_a.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "public_subnet_b_association" {
  subnet_id      = aws_subnet.public_subnet_b.id
  route_table_id = aws_route_table.public_rt.id
}

#OUTPUTS
output "Internet-Gateway" {
  value       = aws_internet_gateway.my_vpc_igw.id
  description = "internet gateway id for my_vpc"
}

output "Public-RT" {
  value       = aws_route.public_rt_route.destination_cidr_block
  description = "internet gateway id for my_vpc"
}
