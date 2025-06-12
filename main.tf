provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}

module "vpc" {
  source   = "./modules/vpc"
  vpc_cidr = "10.0.0.0/16"
  vpc_name = "main-vpc"
  public_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets = ["10.0.3.0/24", "10.0.4.0/24"]
  availability_zones = ["us-east-1a", "us-east-1b"]
}

module "network" {
  source             = "./modules/network"
  vpc_id             = module.vpc.vpc_id
  subnet_id          = module.vpc.public_subnet_ids[0]
  public_subnets     = module.vpc.public_subnet_ids
  private_subnets    = module.vpc.private_subnet_ids
  availability_zones = ["us-east-1a", "us-east-1b"]
}

module "security_groups" {
  source = "./modules/security_groups"
  vpc_id = module.vpc.vpc_id
}

module "ec2" {
  source            = "./modules/ec2"
  instance_type     = "t2.micro"
  subnet_ids        = [module.vpc.public_subnet_ids[0], module.vpc.public_subnet_ids[1]]
  security_group_id = module.security_groups.web_sg_id
  key_name          = "bba06"
}

module "rds" {
  source                = "./modules/rds"
  db_identifier         = "my-rds-instance"
  allocated_storage     = 20
  engine                = "mysql"
  instance_class        = "db.t3.micro"
  db_name               = "mydatabase"
  db_username           = "admin"
  db_password           = var.db_password
  db_subnet_group       = module.network.db_subnet_group_name
  db_security_group_id  = module.security_groups.db_sg_id
  subnet_ids            = module.vpc.private_subnet_ids
}

module "alb" {
  source            = "./modules/alb"
  alb_name          = "web-alb"
  vpc_id            = module.vpc.vpc_id
  security_group_id = module.security_groups.alb_sg_id
  subnet_ids        = module.vpc.public_subnet_ids
  instance_ids      = module.ec2.instance_ids
  domain_name       = "batuakca.com"
  zone_id           = "Z0839751NUGFT3H9KHHH"
}

module "route53" {
  source      = "./modules/route53"
  zone_id     = "Z0839751NUGFT3H9KHHH"  
  domain_name = "batuakca.com"    
  alb_dns_name = module.alb.alb_dns_name
}