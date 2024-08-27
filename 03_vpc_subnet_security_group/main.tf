provider "aws" {
  region = "ap-south-1"  # Specify your desired region
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "my-vpc"
  }
}

resource "aws_subnet" "main" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.10.0/24"
  availability_zone = "ap-south-1a"  # Adjust the availability zone as needed

  tags = {
    Name = "my-subnet"
  }
}
resource "aws_security_group" "main" {
  vpc_id = aws_vpc.main.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Adjust to restrict SSH access to specific IPs
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "my-security-group"
  }
}

resource "aws_instance" "web" {
  ami           = "ami-0c2af51e265bd5e0e"  # Replace with a valid AMI ID for your region
  instance_type = "t2.micro"

  subnet_id              = aws_subnet.main.id
  security_groups        = [aws_security_group.main.id]
  associate_public_ip_address = true
  key_name = "devops_keypair"

  tags = {
    Name = "my-ec2-instance"
  }
}

output "vpc_id" {
  value = aws_vpc.main.id
}

output "subnet_id" {
  value = aws_subnet.main.id
}

output "security_group_id" {
  value = aws_security_group.main.id
}

output "instance_public_ip" {
  value = aws_instance.web.public_ip
}
