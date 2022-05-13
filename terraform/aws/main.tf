provider "aws" {
  region     = "ap-south-1"
  access_key = ""
  secret_key = ""
}


resource "aws_instance" "ec2_demo" {
  ami           = "ami-0438d45f83fd816f6"
  instance_type = "t2.micro"
  tags = {
    Name = "Terraform EC2"
  }
}


# ami-0438d45f83fd816f6


