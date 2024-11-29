
resource "aws_launch_template" "app" {
  name          = "app-launch-template"
  image_id      = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

  network_interfaces {
    associate_public_ip_address = false
    subnet_id                   = var.app_subnet_ids[0]
    security_groups             = [var.app_sg_id] # Use the passed security group
  }

  tags = var.tags
}


resource "aws_autoscaling_group" "asg" {
  launch_template {
    id      = aws_launch_template.app.id
    version = "$Latest"
  }

  vpc_zone_identifier = var.app_subnet_ids
  min_size            = 2
  max_size            = 5
  desired_capacity    = 2

  target_group_arns = [var.alb_target_group_arn]
}

output "asg_id" {
  value = aws_autoscaling_group.asg.id
}
