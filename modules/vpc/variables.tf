
variable "cidr_block" {
  description = "CIDR block for the VPC"
}

variable "public_subnet_cidrs" {
  description = "Public subnet CIDR blocks"
  type        = map(string)
}

variable "app_subnet_cidrs" {
  description = "Application subnet CIDR blocks"
  type        = map(string)
}

variable "db_subnet_cidrs" {
  description = "Database subnet CIDR blocks"
  type        = map(string)
}

variable "availability_zones" {
  description = "Availability zones for subnets"
  type        = map(string)
}

variable "tags" {
  description = "Tags for all resources"
  type        = map(string)
}
