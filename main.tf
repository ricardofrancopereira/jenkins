provider "aws" {
  region = "us-east-1"
}
resource "aws_instance" "primeiroexemplo" {
  ami = "ami-07ebfd5b3428b6f4d"
  instance_type = "t2.micro"
  tags = {
    Name = "Terraformprimeiroexemplo"
  }
}

resource "aws_instance" "terceiroexemplo" {
ami = "ami-07ebfd5b3428b6f4d"
instance_type = "t2.micro"
vpc_security_group_ids = [aws_security_group.instance.id]
user_data = <<-EOF
#!/bin/bash
echo "Hello, World" > index.html
nohup busybox httpd -f -p 8080 &
EOF
tags = {
Name = "terraform-exemplo"
}
}
resource "aws_security_group" "instance" {
name = var .security_group_name
ingress {
from_port = 8080
to_port = 8080
protocol = "tcp"
cidr_blocks = [ "0.0.0.0/0" ]
}
}
variable "security_group_name" {
description = "O nome do security group"
type = string
default = "terraform-exemplo-instancia"
}
output "public_ip" {
value = aws_instance.terceiroexemplo.public_ip
description = "o public IP da Instance"
}


resource "aws_instance" "primeiroexemplo2" {
  ami = "ami-07ebfd5b3428b6f4d"
  instance_type = "t2.micro"
  tags = {
    Name = "Terraform_Jenkins"
  }
}

