variable "name" {
    type = string
    description = "Name of the Code Pipeline configuration"
}

variable "codestar_connection_arn" {
    type = string
    description = "ARN of the codestar connection used to connect to GitHub"
}

variable "asg_list" {
    type = list(string)
    description = "List of Auto Scaling Groups to associate with Code Deploy"
}

variable "web_bucket" {
    type = string
    description = "Name of the S3 bucket containing the web content"
}

variable "codepipeline_bucket" {
    type = string
    description = "Name of the S3 bucket to use for CodePipeline"
}

variable "iam_role_web" {
    type = string
    description = "IAM role used on the web instances. Used to attach the appropriate policies to allow S3 access the web bucket"
}