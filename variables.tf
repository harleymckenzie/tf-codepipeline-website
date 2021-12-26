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