variable "name" {
    type = string
    description = "Name of the web application"
    default = "my-web-app"
}

variable "region" {
    type = string
    description = "The AWS region"
}

variable "vpc_id" {
    type = string
    description = "VPC id of the VPC the web app will be provisioned in"
}

variable "subnet_ids" {
    type = list(string)
    description = "A list of subnet ids being used by the ASG"
}

variable "instance_type" {
    type = string
    description = "Instance size/type to use for the web app"
    default = "t2.micro"
}

variable "ami_id" {
    type = string
    description = "The ami id to use for the web instances. Must be CentOS based, such as Amazon Linux"
}

variable "permitted_ssh_ips" {
	type = list(string)
	description = "list of IPs permitted to SSH into the web instances"
	default = ["0.0.0.0"]
}

variable "keypair" {
    type = string
    description = "Key Pair name to be used for the web app servers"
}

variable "asg_min" {
    type = number
    description = "The minimum count size of the ASG"
    default = 1
}

variable "asg_max" {
    type = number
    description = "The maximum count size of the ASG"
    default = 1
}
variable "ssl_certificate_arn" {
    type = string
    description = "ARN of the SSL certificate on ACM to use for the Load Balancer"
}