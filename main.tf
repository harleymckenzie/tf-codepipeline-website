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

data "template_file" "userdata" {
  template = "${file("${path.module}/userdata.tpl")}"
  vars = {
    region = "${data.aws_region.current.name}"
  }
}

########################################################
# Modules
########################################################

module "vpc-base" {
  source = "./modules/vpc-base"

  name = "${var.name}-${var.env}"
}