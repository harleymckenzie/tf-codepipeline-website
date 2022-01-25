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
# Certificate Resource
########################################################

resource "aws_acm_certificate" "web" {
  domain_name       = var.domain
  subject_alternative_names = ["*.${var.domain}"]
  validation_method = "DNS"
}

########################################################
# Validation
########################################################

resource "aws_route53_record" "ssl-validation" {
    for_each = {
      for dvo in aws_acm_certificate.web.domain_validation_options : dvo.domain_name => {
        name   = dvo.resource_record_name
        record = dvo.resource_record_value
        type   = dvo.resource_record_type
      }
    }
  
  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = var.zone_id
}

resource "aws_acm_certificate_validation" "web" {
  certificate_arn         = aws_acm_certificate.web.arn
  validation_record_fqdns = [for record in aws_route53_record.ssl-validation : record.fqdn]
}