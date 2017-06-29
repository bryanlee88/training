variable "aws_access_key" {
  type = "string"
}

variable "aws_secret_key" {
  type = "string"
}

variable "aws_region" {
  type    = "string"
  default = "ap-southeast-1"
}

variable "count" {
  default = 3
}

variable "num_webs" {
default = "2"
}

variable "command" {
  default = "echo 'Hello World'"
}

provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "ap-southeast-1"
}

resource "aws_instance" "web" {
  ami                    = "ami-2378f540"
  instance_type          = "t2.micro"
  subnet_id              = "subnet-bf2137db"
  vpc_security_group_ids = ["sg-67393600"]

 # count = "${var.count}"
count = "${var.num_webs}"




  tags {
#    "Name" = "${format("web-%03d", count.index + 1, 2)}"
"Name" = "web ${count.index+1}/${var.num_webs}"
    "Identity" = "datapipe-seahorse"
  }
}

#output "public_ip" {
#  value = "${aws_instance.web.1.public_ip}"
#}

#output "public_dns" {
#  value = "${aws_instance.web.1.public_dns}"
#}
