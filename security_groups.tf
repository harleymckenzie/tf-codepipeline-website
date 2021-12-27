resource "aws_security_group" "ssh-access" {
  name        = "ssh-access"
  description = "Allow SSH from trusted IPs"
  vpc_id      = module.vpc-base.vpc_id

  ingress {
    description      = "Allow SSH Access from trusted IPs"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    prefix_list_ids  = [module.vpc-base.prefix-list_id]
    cidr_blocks      = null
    ipv6_cidr_blocks = null
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    "Name" = "allow-ssh"
  }
}

resource "aws_security_group" "elb-web-access" {
  name        = "elb-web-access"
  description = "Allow HTTP/HTTPS from everywhere"
  vpc_id      = module.vpc-base.vpc_id

  ingress {
    description      = "Allow HTTP from everywhere"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description      = "Allow HTTPS from everywhere"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    "Name" = "alb-allow-web"
  }
}

resource "aws_security_group" "ec2-elb-access" {
  name        = "ec2-elb-access"
  description = "Allow HTTP from elb-web-access Security Group"
  vpc_id      = module.vpc-base.vpc_id

  ingress {
    description      = "Allow HTTP from elb-web-access Security Group"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = null
    ipv6_cidr_blocks = null
    security_groups = [ aws_security_group.elb-web-access.id ]
  }

  ingress {
    description      = "Allow HTTPS from elb-web-access Security Group"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = null
    ipv6_cidr_blocks = null
    security_groups = [ aws_security_group.elb-web-access.id ]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    "Name" = "ec2-allow-alb-web"
  }
}