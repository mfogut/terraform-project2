################Private Route Table-A###########################
resource "aws_route_table" "private_rt_a" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "Private-RT-A"
  }
}

resource "aws_route" "private_rt_a_route" {
  route_table_id         = aws_route_table.private_rt_a.id
  destination_cidr_block = var.open_internet
  nat_gateway_id         = aws_nat_gateway.public_subnet_a_nat.id
}

#Route table Subnet Association for "private_rt_a"
resource "aws_route_table_association" "private_subnet_a_association" {
  subnet_id      = aws_subnet.private_subnet_a.id
  route_table_id = aws_route_table.private_rt_a.id
}

resource "aws_route_table_association" "db_subnet_a_association" {
  subnet_id      = aws_subnet.db_subnet_a.id
  route_table_id = aws_route_table.private_rt_a.id
}

#################Private Route Table-B###########################
resource "aws_route_table" "private_rt_b" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "Private-RT-A"
  }
}

resource "aws_route" "private_rt_b_route" {
  route_table_id         = aws_route_table.private_rt_b.id
  destination_cidr_block = var.open_internet
  nat_gateway_id         = aws_nat_gateway.public_subnet_b_nat.id
}

#Route table Subnet Association for "private_rt_b"
resource "aws_route_table_association" "private_subnet_b_association" {
  subnet_id      = aws_subnet.private_subnet_b.id
  route_table_id = aws_route_table.private_rt_b.id
}

resource "aws_route_table_association" "db_subnet_b_association" {
  subnet_id      = aws_subnet.db_subnet_b.id
  route_table_id = aws_route_table.private_rt_b.id
}
