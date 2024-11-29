
variable "app_sg_id" {
  description = "Security group ID for the application"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID for the application"
}

variable "app_subnet_ids" {
  description = "Subnet IDs for the application"
  type        = list(string)
}

variable "alb_target_group_arn" {
  description = "Target group ARN for the ALB"
}

variable "tags" {
  description = "Tags for application resources"
  type        = map(string)
}

variable "ami_id" {
  description = "AMI ID for application instances"
  type        = string
  default = "ami-0e8d228ad90af673b"
}

variable "instance_type" {
  description = "Instance type for application instances"
  type        = string
  default = "t2.micro"
}

variable "key_name" {
  description = "Key pair name for accessing application instances"
  type        = string
  default = "dev-key"
}
