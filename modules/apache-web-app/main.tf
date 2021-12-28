data "template_file" "userdata" {
  template = "${file("${path.module}/userdata.tpl")}"
  vars = {
    region = var.region
  }
}