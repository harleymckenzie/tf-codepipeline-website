resource "aws_lb" "alb" {
    name = "web-alb"
    load_balancer_type = "application"
    security_groups = [ aws_security_group.elb-web-access.id ]
    subnets = [ 
        aws_subnet.public-a.id,
        aws_subnet.public-b.id,
        aws_subnet.public-c.id
    ]
}

resource "aws_lb_target_group" "target-group" {
    name = "web-tg"
    port = 80
    protocol = "HTTP"
    vpc_id = aws_vpc.vpc.id
}

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
    certificate_arn = aws_acm_certificate.web.arn

    default_action {
        type = "forward"
        target_group_arn = aws_lb_target_group.target-group.arn
    }
}