provider "aws" {
  region     = "ap-south-1"
  access_key = "AKIA2HZLLBFST3X2MFJC"
  secret_key = "8B7zsoigvqdXXDWhDCuGve9SLncQXn4npbrxzjyQ"
}

locals {
  testing_env = "testing"
}

resource "aws_instance" "ec2_example" {
   
   ami           = "ami-08ee6644906ff4d6c"
   instance_type = "t2.micro"
   subnet_id = aws_subnet.testing-subnet.id
   
   tags = {
           Name = "${local.testing_env} - Terraform EC2"
   }
}


resource "aws_vpc" "testing-vpc" {
  cidr_block = "10.5.0.0/16"

  tags = {
    Name = "${local.testing_env}-vpc-tag"
  }
}

resource "aws_subnet" "testing-subnet" {
  vpc_id = aws_vpc.testing-vpc.id
  cidr_block = "10.5.0.0/16"

  tags = {
    Name = "${local.testing_env}-subnet-tag"
  }
}
