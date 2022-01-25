output "certificate_arn" {
  description = "ARN of the generated ACM certificate"
  value = aws_acm_certificate.web.arn
}