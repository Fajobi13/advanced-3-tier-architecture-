
# terraform {
#   backend "s3" {
#     bucket         = "your-state-bucket"
#     key            = "terraform/3-tier/terraform.tfstate"
#     region         = "us-east-1"
#     dynamodb_table = "terraform-lock-table"
#     encrypt        = true
#   }
# }