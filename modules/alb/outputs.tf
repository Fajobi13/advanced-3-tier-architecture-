output "alb_arn" {
  value = aws_lb.app_lb.arn
}

output "target_group_arn" {
  value = aws_lb_target_group.app.arn
}

output "alb_dns_name" {
  value = aws_lb.app_lb.dns_name
  description = "The DNS name of the ALB"
}
