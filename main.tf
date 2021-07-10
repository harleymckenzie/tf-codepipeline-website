terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.48.0"
    }
  }

  required_version = ">= 1.0.0"
}

provider "aws" {
  profile = "default"
  region  = "eu-west-1"

  default_tags {
    tags = {
      Stack = "hmckenzie-web"
    }
  }
}