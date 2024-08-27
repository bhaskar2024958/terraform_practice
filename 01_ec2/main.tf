provider "aws" {
  region = "ap-south-1"
  #access_key = ""
  #secret_key = ""
}

resource "aws_instance" "mymachine" {
  ami = "ami-0c2af51e265bd5e0e"
  instance_type = "t2.micro"
  key_name = "devops_keypair"
  vpc_security_group_ids = ["sg-045dc9c1d0f35b660"] 
}

output "publicip" {
  value = aws_instance.mymachine.public_ip
}


