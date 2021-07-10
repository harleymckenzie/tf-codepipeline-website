terraform {
  backend "s3" {
    bucket = "hmckenzie-tf"
    key    = "stack/hmckenzie-web/tfstate"
    region = "eu-west-2"
  }
}
