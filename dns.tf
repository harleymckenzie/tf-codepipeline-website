resource "aws_route53_record" "hostname" {
  zone_id = var.hosted-zone
  name = var.hostname
  type = "A"

  alias {
    name                   = aws_lb.alb.dns_name
    zone_id                = aws_lb.alb.zone_id
    evaluate_target_health = true
  }
}