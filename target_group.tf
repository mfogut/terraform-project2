#Create Target Group
resource "aws_lb_target_group" "lb_tg" {
  name        = "terraform-lb-tg"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.my_vpc.id
  target_type = "instance"
  health_check {
    path                = "/var/www/html/index.html"
    healthy_threshold   = 3
    unhealthy_threshold = 2
    interval            = 5
    matcher             = 200
  }

  tags = {
    Name = "Terraform-TG"
  }
}

#Register Tartget Group

resource "aws_lb_target_group_attachment" "al_tg_register" {
  count             = 2
  target_group_arn  = aws_lb_target_group.lb_tg.arn
  target_id         = local.app_servers[count.index]
  port              = 80
  availability_zone = length(slice(local.az_names, 0, 2))
}
