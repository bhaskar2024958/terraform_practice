provider "aws" {
  region = "ap-south-1"
  #access_key = ""
  #secret_key = ""
}

resource "aws_instance" "mymachine" {
  ami = var.myami
  instance_type = var.myinstance
  key_name = var.ssh_key_name
}
output "publicip" {
  value = aws_instance.mymachine.public_ip
}