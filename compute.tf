resource "aws_launch_template" "web" {
    name = "web-launch-config"
    image_id = var.web-ami
    instance_type = var.web-instance-type
    vpc_security_group_ids = [ aws_security_group.ec2-elb-access.id ]

    tag_specifications {
        resource_type = "instance"

        tags = {
            Name = "hmckenzie-web"
        }
    }
}

resource "aws_autoscaling_group" "asg" {
    name = "web-asg"
    min_size = 1
    max_size = 1
    target_group_arns = [ aws_lb_target_group.target-group.id ]
    vpc_zone_identifier = [
        aws_subnet.public-a.id,
        aws_subnet.public-b.id,
        aws_subnet.public-c.id
    ]

    launch_template { 
        id = aws_launch_template.web.id
        version = "$Latest"
    }
}