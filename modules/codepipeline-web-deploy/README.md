# Code Pipeline Web Deployment Module

**Note**: Ability to specify a custom repository and branch has not yet been added.

Module to configure a Code Pipeline to deploy static web content stored in a specified GitHub repo.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 2.7.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 2.7.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_codedeploy_app.webapp](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/codedeploy_app) | resource |
| [aws_codedeploy_deployment_group.web](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/codedeploy_deployment_group) | resource |
| [aws_codepipeline.codepipeline](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/codepipeline) | resource |
| [aws_iam_role.codedeploy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.codepipeline](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.codedeploy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_iam_role_policy.codepipeline](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_iam_role_policy.deploy-bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_iam_role_policy.web-bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_asg_list"></a> [asg\_list](#input\_asg\_list) | List of Auto Scaling Groups to associate with Code Deploy | `list(string)` | n/a | yes |
| <a name="input_codepipeline_bucket"></a> [codepipeline\_bucket](#input\_codepipeline\_bucket) | Name of the S3 bucket to use for CodePipeline | `string` | n/a | yes |
| <a name="input_codestar_connection_arn"></a> [codestar\_connection\_arn](#input\_codestar\_connection\_arn) | ARN of the codestar connection used to connect to GitHub | `string` | n/a | yes |
| <a name="input_iam_role_web"></a> [iam\_role\_web](#input\_iam\_role\_web) | IAM role used on the web instances. Used to attach the appropriate policies to allow S3 access the web bucket | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Name of the Code Pipeline configuration | `string` | n/a | yes |
| <a name="input_web_bucket"></a> [web\_bucket](#input\_web\_bucket) | Name of the S3 bucket containing the web content | `string` | n/a | yes |

## Outputs

No outputs.