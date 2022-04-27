provider "aws" {
  region     = "ap-south-1"
  access_key = "AKIA2HZLLBFST3X2MFJC"
  secret_key = "8B7zsoigvqdXXDWhDCuGve9SLncQXn4npbrxzjyQ"
}


resource "aws_instance" "ec2_example" {

   ami           = "ami-08ee6644906ff4d6c"
   instance_type =  var.instance_type

   tags = {
           Name = var.environment_name   # creating file for different env like prod, staging (supplying those values inside this tag variable)
   }
} 
