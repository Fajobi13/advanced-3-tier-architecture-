
variable "public_sg_id" {
  description = "Security group ID for the Application Load Balancer"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID for the ALB"
}

variable "public_subnet_ids" {
  description = "Public subnet IDs for the ALB"
  type        = list(string)
}

variable "tags" {
  description = "Tags for ALB resources"
  type        = map(string)
}
