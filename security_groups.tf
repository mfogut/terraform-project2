#Bashtion Host SG#####################################
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
########################################################
#Application Load Balancer SG
resource "aws_security_group" "alb_sg" {
  name        = "ALB-SG"
  description = "Allow all HTTP traffic"
  vpc_id      = aws_vpc.my_vpc.id

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
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
    Name = "ALB-SG"
  }
}

########################################################
#App Server SG
resource "aws_security_group" "app_server_sg" {
  name        = "AppServer-SG"
  description = "Allow SSH traffic from Bashtion Host and all HTTP traffic"
  vpc_id      = aws_vpc.my_vpc.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [aws_security_group.bashtion_sg.id]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [aws_security_group.alb_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.open_internet]
  }

  tags = {
    Name = "AppServer-SG"
  }
}
