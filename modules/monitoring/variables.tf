variable "app_asg_id" {
  description = "Auto Scaling Group ID for the application"
}

variable "alb_arn" {
  description = "ARN of the Application Load Balancer"
}

variable "db_instance_id" {
  description = "Instance ID of the RDS database"
}

variable "aws_region" {
  description = "AWS region for the dashboard URL"
}

variable "tags" {
  description = "Tags for monitoring resources"
  type        = map(string)
}



