
resource "aws_db_subnet_group" "db" {
  name       = "db-subnet-group"
  subnet_ids = var.db_subnet_ids
  tags       = var.tags
}

resource "aws_db_instance" "rds" {
  allocated_storage    = 20
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  db_name                 = "appdb"
  username             = var.db_credentials.username
  password             = var.db_credentials.password
  multi_az             = true
  publicly_accessible  = false
  db_subnet_group_name = aws_db_subnet_group.db.name
  tags                 = var.tags
}

output "db_instance_id" {
  value = aws_db_instance.rds.id
}