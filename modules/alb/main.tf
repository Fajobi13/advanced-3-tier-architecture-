
resource "aws_lb" "app_lb" {
  name               = "app-lb"
  load_balancer_type = "application"
  internal           = false
  security_groups    = [var.public_sg_id] # Use the passed security group
  subnets            = var.public_subnet_ids
  tags               = var.tags
}


resource "aws_lb_target_group" "app" {
  name        = "app-target-group"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  tags        = var.tags
}


resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.app_lb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app.arn
  }

  depends_on = [
    aws_lb.app_lb,
    aws_lb_target_group.app
  ]
}


