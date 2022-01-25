output "zone_id" {
    value = data.aws_route53_zone.web.id
    description = "The Route 53 Zone ID"
}