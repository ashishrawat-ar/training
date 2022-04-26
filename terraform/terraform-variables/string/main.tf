provider "aws" {
  region     = "eu-central-1"
  access_key = "AKIA2HZLLBFST3X2MFJC"
  secret_key = "8B7zsoigvqdXXDWhDCuGve9SLncQXn4npbrxzjyQ"
}

resource "aws_instance" "ec2_example" {

   ami           = "ami-0767046d1677be5a0"
   instance_type =  var.instance_type         # declare variable

   tags = {
           Name = "Terraform EC2"
   }
}

# define variable (actual value what it going to hold)

variable "instance_type" {                     # variable is the keyword and then variable name
   description = "Instance type t2.micro"      # description about the purpose of the variable (any meaningful name)
   type        = string                        # what type of variable it is going to be ex - string, bool, number
   default     = "t2.micro"                    # What would be the default value of the variable (value of this string type variable)
}
