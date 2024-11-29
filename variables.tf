variable "aws_region" {
  description = "AWS region for deployment"
  default     = "eu-west-2"
}

variable "cidr_block" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "Public subnet CIDR blocks"
  type        = map(string)
  default = {
    "subnet-1" = "10.0.1.0/24"
    "subnet-2" = "10.0.2.0/24"
  }
}

variable "app_subnet_cidrs" {
  description = "Application subnet CIDR blocks"
  type        = map(string)
  default = {
    "subnet-1" = "10.0.3.0/24"
    "subnet-2" = "10.0.4.0/24"
  }
}

variable "db_subnet_cidrs" {
  description = "Database subnet CIDR blocks"
  type        = map(string)
  default = {
    "subnet-1" = "10.0.5.0/24"
    "subnet-2" = "10.0.6.0/24"
  }
}

variable "availability_zones" {
  description = "Availability zones for subnets"
  type        = map(string)
  default = {
    "subnet-1" = "eu-west-2a"
    "subnet-2" = "eu-west-2b"
  }
}

variable "db_credentials" {
  description = "Database username and password"
  type = object({
    username = string
    password = string
  })
}

variable "global_tags" {
  description = "Global tags for all resources"
  type        = map(string)
  default = {
    Environment = "Production"
    Project     = "3-Tier Architecture"
  }
}
