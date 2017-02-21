variable "name" {}
variable "owner" {}
variable "key_path" {}
variable "ami" {}
variable "key_name" {}
variable "security_groups" {}
variable "subnet_id" {}
variable "instance_type" {}

resource "aws_instance" "bastion" {

  ami = "${var.ami}"
  instance_type = "${var.instance_type}"
  key_name = "${var.key_name}"
  security_groups = ["${split(",", replace(var.security_groups, "/,\\s?$/", ""))}"]

  subnet_id = "${var.subnet_id}"
  associate_public_ip_address = true
  source_dest_check = false
  tags = {
    Name = "${var.name}"
    Created-By = "${var.owner}"
  }
}