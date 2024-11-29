resource "aws_vpc" "main" {
  cidr_block           = var.cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags                 = merge(var.tags, { Name = "VPC" })
}

resource "aws_subnet" "public" {
  for_each = var.public_subnet_cidrs
  vpc_id   = aws_vpc.main.id
  cidr_block = each.value
  map_public_ip_on_launch = true
  availability_zone = var.availability_zones[each.key]
  tags = merge(var.tags, { Name = "Public-Subnet-${each.key}" })
}

resource "aws_subnet" "app" {
  for_each = var.app_subnet_cidrs
  vpc_id   = aws_vpc.main.id
  cidr_block = each.value
  availability_zone = var.availability_zones[each.key]
  tags = merge(var.tags, { Name = "App-Subnet-${each.key}" })
}

resource "aws_subnet" "db" {
  for_each = var.db_subnet_cidrs
  vpc_id   = aws_vpc.main.id
  cidr_block = each.value
  availability_zone = var.availability_zones[each.key]
  tags = merge(var.tags, { Name = "DB-Subnet-${each.key}" })
}


# Security Groups
resource "aws_security_group" "public_sg" {
  vpc_id = aws_vpc.main.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(var.tags, { Name = "Public-SG" })
}

resource "aws_security_group" "app_sg" {
  vpc_id = aws_vpc.main.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = values(aws_subnet.public)[*].cidr_block
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(var.tags, { Name = "App-SG" })
}

resource "aws_security_group" "db_sg" {
  vpc_id = aws_vpc.main.id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = values(aws_subnet.app)[*].cidr_block
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(var.tags, { Name = "DB-SG" })
}

# ALB Security Group
resource "aws_security_group" "alb_sg" {
  vpc_id = aws_vpc.main.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(var.tags, { Name = "ALB-SG" })
}


resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags   = merge(var.tags, { Name = "Internet-Gateway" })
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = merge(var.tags, { Name = "Public-Route-Table" })
}

resource "aws_route_table_association" "public" {
  for_each = aws_subnet.public
  subnet_id = each.value.id
  route_table_id = aws_route_table.public.id
}
