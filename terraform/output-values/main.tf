provider "aws" {
  region     = "ap-south-1"
  access_key = "AKIA2HZLLBFST3X2MFJC"
  secret_key = "8B7zsoigvqdXXDWhDCuGve9SLncQXn4npbrxzjyQ"
}

resource "aws_instance" "ec2_example" {

   ami           = "ami-08ee6644906ff4d6c"
   instance_type =  var.instance_type

   tags = {
           Name = "Terraform EC2"
   }
} 


output "my_output" {
  value = aws_instance.ec2_example.public_ip   # print our insance ip-address 
#   sensitive = true             # it's will not print sensitive info on terminal
} 
