########################################################
# Application Load Balancer
########################################################

resource "aws_lb" "alb" {
    name = "${var.name}-web-alb"
    load_balancer_type = "application"
    security_groups = [ aws_security_group.elb-web-access.id ]
    subnets = var.subnet_ids
}

########################################################
# LB Target Groups
########################################################

resource "aws_lb_target_group" "target-group" {
    name = "${var.name}-web-tg"
    port = 80
    protocol = "HTTP"
    vpc_id = var.vpc_id
}

########################################################
# Application Load Balancer Listeners
########################################################

resource "aws_lb_listener" "http-listener" {
    load_balancer_arn = aws_lb.alb.arn
    port = 80
    protocol = "HTTP"

    default_action {
        type = "redirect"
            
        redirect {    
            port = "443"
            protocol = "HTTPS"
            status_code = "HTTP_301"
        }
    }
}

resource "aws_lb_listener" "https-listener" {
    load_balancer_arn = aws_lb.alb.arn
    port = 443
    protocol = "HTTPS"
    certificate_arn = var.ssl_certificate_arn

    default_action {
        type = "forward"
        target_group_arn = aws_lb_target_group.target-group.arn
    }
}