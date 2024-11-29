
provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source               = "./modules/vpc"
  cidr_block           = var.cidr_block
  public_subnet_cidrs  = var.public_subnet_cidrs
  app_subnet_cidrs     = var.app_subnet_cidrs
  db_subnet_cidrs      = var.db_subnet_cidrs
  availability_zones   = var.availability_zones
  tags                 = var.global_tags
}

module "alb" {
  source            = "./modules/alb"
  vpc_id            = module.vpc.vpc_id
  public_subnet_ids = module.vpc.public_subnet_ids
  public_sg_id      = module.vpc.public_sg_id # Pass the public_sg_id from the VPC module
  tags              = var.global_tags
}


module "app" {
  source              = "./modules/app"
  vpc_id              = module.vpc.vpc_id
  app_subnet_ids      = module.vpc.app_subnet_ids
  alb_target_group_arn = module.alb.target_group_arn
  app_sg_id           = module.vpc.app_sg_id # Pass the app_sg_id from the VPC module
  tags                = var.global_tags
}


module "db" {
  source         = "./modules/db"
  vpc_id         = module.vpc.vpc_id
  db_subnet_ids  = module.vpc.db_subnet_ids
  db_sg_id       = module.vpc.db_sg_id # Pass the db_sg_id from the VPC module
  db_credentials = var.db_credentials
  tags           = var.global_tags
}


module "monitoring" {
  source         = "./modules/monitoring"
  app_asg_id     = module.app.asg_id
  alb_arn        = module.alb.alb_arn
  db_instance_id = module.db.db_instance_id
  aws_region     = var.aws_region
  tags           = var.global_tags
}
