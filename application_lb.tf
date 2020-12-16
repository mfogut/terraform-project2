resource "aws_lb" "app_lb" {
  name               = "test-lb-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = local.app_server_subnets

  tags = {
    Name = "Terraform-ALB"
  }
}
