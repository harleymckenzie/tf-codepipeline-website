variable "name" {
  type  = string
  description = "The name to assign to the environment"
}

variable "env" {
  type  = string
  description = "Name of the environment, such as 'live' or 'development'"
}

variable "web-ami" {
  type    = string
  description   = "AMI to use for the web instance"
}

variable "web-instance-type" {
  type    = string
  description = "Instance type to use for the web servers"
  default = "t2.micro"
}

variable "keypair" {
  type = string
  description = "Name of the key to associate with the web instance"
}

variable "apex-domain" {
  type  = string
  description = "(optional) The apex domain of the hostname being used for the frontend. This can be left blank if the apex is being used for the frontend."
  default = ""
}

variable "hostname" {
  type    = string
  description = "Hostname to use for the frontend"
}

variable "codepipeline-bucket" {
  type = string
  description = "Name of the S3 bucket to use for CodePipeline"
}

variable "web-bucket" {
  type = string
  description = "Name of the S3 bucket containing the web content"
}

variable "codestar-connection-arn" {
  type = string
  description = "The ARN of the codestar connection used to connect to the VC (ie GitHub)"
}

variable "permitted_ssh_ips" {
  type = list(string)
  description = "List of IPs to permit SSH access to on the web instances"
}