resource "aws_security_group" "bashtion_sg" {
  name        = "Bashtion-SG"
  description = "Allow all SSH traffic"
  vpc_id      = aws_vpc.my_vpc.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.open_internet]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.open_internet]
  }

  tags = {
    Name = "Bashtion-SG"
  }
}
