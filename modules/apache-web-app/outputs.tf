output "autoscaling_group_name" {
    value = aws_autoscaling_group.asg.name
}

output "lb_dns_name" {
    value = aws_lb.alb.dns_name
}

output "lb_zone_id" {
    value = aws_lb.alb.zone_id
}

output "iam_role_web" {
    value = aws_iam_role.web.id
}