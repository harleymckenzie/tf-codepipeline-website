# hmckenzie.net Terraform Stack

**Note**: This project was created for the purpose of my own personal portfolio website.

While there are customisable variables, I have set the default and flexibility to match my own personal needs.

## Prerequisites
- S3 Bucket
  - A bucket containing the static web content (I'm personally using Hugo)
  - Another bucket to store the CodePipeline artifacts
- Your own domain hosted in Route 53
- A Key Pair in the region this is being deployed in
- A connection to have been manually created to your repo in CodePipeline 


<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 3.48.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 3.48.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_acm-certificate"></a> [acm-certificate](#module\_acm-certificate) | ./modules/acm-certificate | n/a |
| <a name="module_apache-web-app"></a> [apache-web-app](#module\_apache-web-app) | ./modules/apache-web-app | n/a |
| <a name="module_codepipeline-web-deploy"></a> [codepipeline-web-deploy](#module\_codepipeline-web-deploy) | ./modules/codepipeline-web-deploy | n/a |
| <a name="module_route53-dns"></a> [route53-dns](#module\_route53-dns) | ./modules/route53-dns | n/a |
| <a name="module_vpc-base"></a> [vpc-base](#module\_vpc-base) | ./modules/vpc-base | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_apex-domain"></a> [apex-domain](#input\_apex-domain) | (optional) The apex domain of the hostname being used for the frontend. This can be left blank if the apex is being used for the frontend. | `string` | `""` | no |
| <a name="input_codepipeline-bucket"></a> [codepipeline-bucket](#input\_codepipeline-bucket) | Name of the S3 bucket to use for CodePipeline | `string` | n/a | yes |
| <a name="input_codestar-connection-arn"></a> [codestar-connection-arn](#input\_codestar-connection-arn) | The ARN of the codestar connection used to connect to the VC (ie GitHub) | `string` | n/a | yes |
| <a name="input_env"></a> [env](#input\_env) | Name of the environment, such as 'live' or 'development' | `string` | n/a | yes |
| <a name="input_hostname"></a> [hostname](#input\_hostname) | Hostname to use for the frontend | `string` | n/a | yes |
| <a name="input_keypair"></a> [keypair](#input\_keypair) | Name of the key to associate with the web instance | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name to assign to the environment | `string` | n/a | yes |
| <a name="input_permitted_ssh_ips"></a> [permitted\_ssh\_ips](#input\_permitted\_ssh\_ips) | List of IPs to permit SSH access to on the web instances | `list(string)` | n/a | yes |
| <a name="input_web-ami"></a> [web-ami](#input\_web-ami) | AMI to use for the web instance | `string` | n/a | yes |
| <a name="input_web-bucket"></a> [web-bucket](#input\_web-bucket) | Name of the S3 bucket containing the web content | `string` | n/a | yes |
| <a name="input_web-instance-type"></a> [web-instance-type](#input\_web-instance-type) | Instance type to use for the web servers | `string` | `"t2.micro"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->

#### Diagram
![hmckenzie-net-cfn-diagram](https://hmckenzie-public.s3.eu-west-1.amazonaws.com/media/hmckenzie.net+-+AWS.jpg)

# Author
[Harley McKenzie](https://hmckenzie.net) - Creator