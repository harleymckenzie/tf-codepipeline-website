resource "aws_launch_template" "web" {
    name = "web-launch-template"
    image_id = var.web-ami
    instance_type = var.web-instance-type
    key_name = var.keypair

    iam_instance_profile {
        name = aws_iam_instance_profile.web.name
    }

    network_interfaces {
        associate_public_ip_address = true
        security_groups = [ 
            aws_security_group.ec2-elb-access.id,
            aws_security_group.ssh-access.id
        ]
    }

    tag_specifications {
        resource_type = "instance"

        tags = {
            Name = "hmckenzie-web"
        }
    }
    user_data = base64encode(data.template_file.userdata.rendered)
}

resource "aws_autoscaling_group" "asg" {
    name = "web-asg"
    min_size = 1
    max_size = 1
    target_group_arns = [ aws_lb_target_group.target-group.id ]
    vpc_zone_identifier = [
        module.vpc-base.subnet_public-a,
        module.vpc-base.subnet_public-b,
        module.vpc-base.subnet_public-c
    ]

    launch_template { 
        id = aws_launch_template.web.id
        version = "$Latest"
    }
}