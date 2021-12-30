output "autoscaling_group_name" {
    value = aws_autoscaling_group.asg.name
    description = "Name of the Auto Scaling Group"
}

output "lb_dns_name" {
    value = aws_lb.alb.dns_name
    description = "DNS name of the Application Load Balancer"
}

output "lb_zone_id" {
    value = aws_lb.alb.zone_id
    description = "Zone ID for the Application Load Balancer"
}

output "iam_role_web" {
    value = aws_iam_role.web.id
    description = "Resouce id of the IAM Web Role"
}