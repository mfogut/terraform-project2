resource "aws_lb" "app_lb" {
  name               = "test-lb-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = aws_subnet.public_subnet_.*.id

  tags = {
    Name = "Terraform-ALB"
  }
}
