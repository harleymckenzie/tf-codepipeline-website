########################################################
# Launch Template
########################################################

resource "aws_launch_template" "web" {
    name = "${var.name}-web-launch-template"
    image_id = var.ami_id
    instance_type = var.instance_type
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
            Name = "${var.name}-web"
        }
    }
    user_data = base64encode(data.template_file.userdata.rendered)
}

########################################################
# Auto Scaling Group
########################################################

resource "aws_autoscaling_group" "asg" {
    name = "${var.name}-web-asg"
    min_size = var.asg_min
    max_size = var.asg_max
    target_group_arns = [ aws_lb_target_group.target-group.id ]
    vpc_zone_identifier = var.subnet_ids

    launch_template { 
        id = aws_launch_template.web.id
        version = "$Latest"
    }
}