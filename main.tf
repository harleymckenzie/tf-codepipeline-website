########################################################
# Terraform Configuration
########################################################
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.48.0"
    }
  }

  required_version = "~> 1.1.0"
}

########################################################
# AWS Provider
########################################################

provider "aws" {
  profile = "default"
  region  = "eu-west-1"

  default_tags {
    tags = {
      Stack = "${var.name}-${var.env}"
    }
  }
}

data "aws_region" "current" {}

########################################################
# Modules
########################################################

module "vpc-base" {
  source = "./modules/vpc-base"

  name = "${var.name}-${var.env}"
}

module "apache-web-app" {
  source = "./modules/apache-web-app"

  name = "${var.name}-${var.env}"
  region = "${data.aws_region.current.name}"
  
  vpc_id = module.vpc-base.vpc_id
  subnet_ids = [
    module.vpc-base.subnet_private-a,
    module.vpc-base.subnet_private-b,
    module.vpc-base.subnet_private-c
  ]
  permitted_ssh_ips = var.permitted_ssh_ips
  
  instance_type = var.web-instance-type
  ami_id = var.web-ami
  keypair = var.keypair

  ssl_certificate_arn = aws_acm_certificate.web.arn
}