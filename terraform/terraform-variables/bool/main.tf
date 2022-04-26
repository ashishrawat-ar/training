provider "aws" {
  region     = "eu-central-1"
  access_key = "AKIA2HZLLBFST3X2MFJC"
  secret_key = "8B7zsoigvqdXXDWhDCuGve9SLncQXn4npbrxzjyQ"
}

resource "aws_instance" "ec2_example" {

   ami           = "ami-0767046d1677be5a0"
   instance_type =  "t2.micro"
   count = 1
  associate_public_ip_address = var.enable_public_ip   # enabling the public ip address

   tags = {
           Name = "Terraform EC2"
   }

}

variable "enable_public_ip" {
  description = "Enable public IP address"
  type        = bool                        # it can hold 2 value either true or false  (true for enabling the associated ip address)
  default     = true
}
