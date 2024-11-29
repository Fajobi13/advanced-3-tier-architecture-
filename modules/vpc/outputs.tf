
output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnet_ids" {
  value = values(aws_subnet.public)[*].id
}

output "app_subnet_ids" {
  value = values(aws_subnet.app)[*].id
}

output "db_subnet_ids" {
  value = values(aws_subnet.db)[*].id
}

output "public_sg_id" {
  value = aws_security_group.public_sg.id
}

output "app_sg_id" {
  value = aws_security_group.app_sg.id
}


output "db_sg_id" {
  value = aws_security_group.db_sg.id
}

output "internet_gateway_id" {
  value = aws_internet_gateway.igw.id
}
