variable "name" {
  type  = string
}

variable "env" {
  type  = string
}

variable "web-ami" {
  type    = string
}

variable "web-instance-type" {
  type    = string
  default = "t2.micro"
}

variable "keypair" {
  type = string
}

variable "apex-domain" {
  type  = string
  default = ""
}

variable "hostname" {
  type    = string
}

variable "codepipeline-bucket" {
  type = string
}

variable "web-bucket" {
  type = string
}

variable "codestar-connection-arn" {
  type = string
}

variable "permitted_ssh_ips" {
  type = list(string)
}