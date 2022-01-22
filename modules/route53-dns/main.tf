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
# Resources
########################################################

# If an apex domain hasn't been set, assume that it is the hostname var
data "aws_route53_zone" "web" {
  name = var.zone_hostname
  private_zone = false
}

resource "aws_route53_record" "hostname" {
  zone_id = data.aws_route53_zone.web.id
  name = var.record_name
  type = "A"

  alias {
    name                   = var.alb_dns_name
    zone_id                = var.alb_zone_id
    evaluate_target_health = true
  }
}