resource "aws_cloudwatch_dashboard" "dashboard" {
  dashboard_name = "3-Tier-Dashboard"
  dashboard_body = jsonencode({
    widgets = [
      {
        type = "metric"
        x    = 0
        y    = 0
        width = 12
        height = 6
        properties = {
          metrics = [
            [ "AWS/EC2", "CPUUtilization", "AutoScalingGroupName", var.app_asg_id ]
          ]
          region = var.aws_region
          period = 300
          stat   = "Average"
          title  = "ASG CPU Utilization"
        }
      },
      {
        type = "metric"
        x    = 12
        y    = 0
        width = 12
        height = 6
        properties = {
          metrics = [
            [ "AWS/ApplicationELB", "HTTPCode_Target_4XX_Count", "LoadBalancer", var.alb_arn ]
          ]
          region = var.aws_region
          period = 300
          stat   = "Sum"
          title  = "ALB 4XX Errors"
        }
      },
      {
        type = "metric"
        x    = 0
        y    = 6
        width = 12
        height = 6
        properties = {
          metrics = [
            [ "AWS/RDS", "ReadLatency", "DBInstanceIdentifier", var.db_instance_id ]
          ]
          region = var.aws_region
          period = 300
          stat   = "Average"
          title  = "RDS Read Latency"
        }
      }
    ]
  })
}
