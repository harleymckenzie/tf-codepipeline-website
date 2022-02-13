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
    module.vpc-base.subnet_public-a,
    module.vpc-base.subnet_public-b,
    module.vpc-base.subnet_public-c
  ]
  permitted_ssh_ips = var.permitted_ssh_ips
  
  instance_type = var.web-instance-type
  ami_id = var.web-ami
  keypair = var.keypair

  ssl_certificate_arn = module.acm-certificate.certificate_arn
}

module "route53-dns" {
  source = "./modules/route53-dns"

  zone_hostname = var.apex-domain == "" ? var.hostname : var.apex-domain
  
  record_name = var.hostname
  alb_dns_name = module.apache-web-app.lb_dns_name
  alb_zone_id = module.apache-web-app.lb_zone_id
}

module "acm-certificate" {
  source = "./modules/acm-certificate"

  domain = var.apex-domain == "" ? var.hostname : var.apex-domain
  zone_id = module.route53-dns.zone_id
}

module "codepipeline-web-deploy" {
  source = "./modules/codepipeline-web-deploy"

  name = "${var.name}-${var.env}"
  codestar_connection_arn = var.codestar-connection-arn
  repository_id = var.repository_id
  branch = var.branch
  asg_list = [module.apache-web-app.autoscaling_group_name]

  iam_role_web = module.apache-web-app.iam_role_web

  web_bucket = var.web-bucket
  codepipeline_bucket = var.codepipeline-bucket
}