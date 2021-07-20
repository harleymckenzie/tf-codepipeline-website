resource "aws_acm_certificate" "web" {
  domain_name       = var.hostname
  subject_alternative_names = ["*.${var.hostname}"]
  validation_method = "DNS"
}

