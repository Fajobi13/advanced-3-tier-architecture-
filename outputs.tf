
output "vpc_id" {
  value = module.vpc.vpc_id
}

output "alb_dns" {
  value = module.alb.alb_dns_name
  description = "The DNS name of the Application Load Balancer"
}


output "app_asg_id" {
  value = module.app.asg_id
}

output "db_instance_id" {
  value = module.db.db_instance_id
  description = "The ID of the RDS database instance"
}

