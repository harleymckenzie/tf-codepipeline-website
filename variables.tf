variable "web-ami" {
  type    = string
  default = "ami-04c2a5c7e6c051fb2"
}

variable "web-instance-type" {
  type    = string
  default = "t4g.micro"
}

variable "keypair" {
    type = string
    default = "hmckenzie-london"
}

variable "hostname" {
  type    = string
  default = "hmckenzie.net"
}

variable "codepipeline-bucket" {
  type = string
  default = "hmckenzie-codepipeline"
}

variable "web-bucket" {
  type = string
  default = "hmckenzie-web-content"
}

variable "codestar-connection-arn" {
  type = string
  default = "arn:aws:codestar-connections:eu-west-1:077965743439:connection/8eabd531-72a2-44b3-bd85-03614028ae60"
}