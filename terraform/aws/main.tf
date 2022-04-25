provider "aws" {
  region     = "ap-south-1"
  access_key = "AKIA2HZLLBFST3X2MFJC"
  secret_key = "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"
}


resource "aws_instance" "ec2_demo" {
  ami           = "ami-0438d45f83fd816f6"
  instance_type = "t2.micro"
  tags = {
    Name = "Terraform EC2"
  }
}


# ami-0438d45f83fd816f6


