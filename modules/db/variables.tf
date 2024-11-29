
variable "vpc_id" {
  description = "VPC ID where the database will be deployed"
}

variable "db_subnet_ids" {
  description = "Subnets for the database"
  type        = list(string)
}

variable "db_sg_id" {
  description = "Security group ID for the database"
  type        = string
}


variable "db_credentials" {
  description = "Credentials for the database"
  type = object({
    username = string
    password = string
  })
}

variable "tags" {
  description = "Tags for the database resources"
  type        = map(string)
}
