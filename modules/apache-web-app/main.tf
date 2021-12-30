########################################################
# Module Requirements
########################################################

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 2.7.0"
    }
  }

  required_version = ">= 0.13.0"
}

########################################################
# User Data Data Source
########################################################

data "template_file" "userdata" {
  template = "${file("${path.module}/userdata.tpl")}"
  vars = {
    region = var.region
  }
}