provider "aws" {
  region     = "ap-south-1"
  access_key = "AKIA2HZLLBFST3X2MFJC"
  secret_key = "8B7zsoigvqdXXDWhDCuGve9SLncQXn4npbrxzjyQ"
}


resource "aws_instance" "ec2_example" {

   ami           = "ami-08ee6644906ff4d6c"
   instance_type =  "t2.micro"
   tags = {
        Name = "Terraform EC2"
    }
 

  provisioner "local-exec" {     # mandatory argument which always need to pass along whenever implementing the local-exec provisioners.
    command = "touch hello-terraform.txt"
  }
}


