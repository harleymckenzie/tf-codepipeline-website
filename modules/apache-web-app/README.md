<!-- BEGIN_TF_DOCS -->
# Apache ASG Terraform module
Terraform module to provision an ASG preconfigured with:
* Apache
* The CodeDeploy agent

While I've added the ability to specify the min and max count of the ASG, I haven't yet had a need to increase this to a size bigger than 1, so I haven't included a Scaling Policy.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 2.7.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 2.7.0 |
| <a name="provider_template"></a> [template](#provider\_template) | n/a |

## Modules

No modules.

## Usage
```hcl
module "apache-web-app" {
    name = "my-web-app"
    instance_type = "t2.micro"
    
    vpc_id = "vpc-xxxxxx"
    subnet_ids = ["subnet-xxxxxxx, subnet-xxxxxxx"]
    ami_id = "ami-abcd1234"
    permitted_ssh_ips = ["1.2.3.4, 4.3.2.1"]
    key_pair = "my_key_pair"

    asg_min = 1
    asg_max = 2
}
```

## Resources

| Name | Type |
|------|------|
| [aws_autoscaling_group.asg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_group) | resource |
| [aws_iam_instance_profile.web](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_instance_profile) | resource |
| [aws_iam_role.web](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_launch_template.web](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/launch_template) | resource |
| [aws_lb.alb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb) | resource |
| [aws_lb_listener.http-listener](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_listener.https-listener](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_target_group.target-group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group) | resource |
| [aws_security_group.ec2-elb-access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.elb-web-access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.ssh-access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [template_file.userdata](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ami_id"></a> [ami\_id](#input\_ami\_id) | The ami id to use for the web instances. Must be CentOS based, such as Amazon Linux | `string` | n/a | yes |
| <a name="input_asg_max"></a> [asg\_max](#input\_asg\_max) | The maximum count size of the ASG | `number` | `1` | no |
| <a name="input_asg_min"></a> [asg\_min](#input\_asg\_min) | The minimum count size of the ASG | `number` | `1` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | Instance size/type to use for the web app | `string` | `"t2.micro"` | no |
| <a name="input_keypair"></a> [keypair](#input\_keypair) | Key Pair name to be used for the web app servers | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Name of the web application | `string` | `"my-web-app"` | no |
| <a name="input_permitted_ssh_ips"></a> [permitted\_ssh\_ips](#input\_permitted\_ssh\_ips) | list of IPs permitted to SSH into the web instances | `list(string)` | <pre>[<br>  "0.0.0.0"<br>]</pre> | no |
| <a name="input_region"></a> [region](#input\_region) | The AWS region | `string` | n/a | yes |
| <a name="input_ssl_certificate_arn"></a> [ssl\_certificate\_arn](#input\_ssl\_certificate\_arn) | ARN of the SSL certificate on ACM to use for the Load Balancer | `string` | n/a | yes |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | A list of subnet ids being used by the ASG | `list(string)` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC id of the VPC the web app will be provisioned in | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_autoscaling_group_name"></a> [autoscaling\_group\_name](#output\_autoscaling\_group\_name) | Name of the Auto Scaling Group |
| <a name="output_iam_role_web"></a> [iam\_role\_web](#output\_iam\_role\_web) | Resouce id of the IAM Web Role |
| <a name="output_lb_dns_name"></a> [lb\_dns\_name](#output\_lb\_dns\_name) | DNS name of the Application Load Balancer |
| <a name="output_lb_zone_id"></a> [lb\_zone\_id](#output\_lb\_zone\_id) | Zone ID for the Application Load Balancer |
<!-- END_TF_DOCS -->