provider "aws" {
  region = "ap-south-1"
  #access_key = ""
  #secret_key = ""
}

resource "aws_instance" "mymachine" {
  count = var.mycount
  ami = var.myami
  instance_type = var.myinstance
}

 