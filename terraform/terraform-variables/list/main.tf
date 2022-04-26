provider "aws" {
  region     = "eu-central-1"
  access_key = "AKIA2HZLLBFST3X2MFJC"
  secret_key = "8B7zsoigvqdXXDWhDCuGve9SLncQXn4npbrxzjyQ"
}

resource "aws_instance" "ec2_example" {

   ami           = "ami-0767046d1677be5a0"
   instance_type =  "t2.micro"
   count = 1

   tags = {
           Name = "Terraform EC2"
   }

}

resource "aws_iam_user" "example" {
  count = length(var.user_names)        # defined function length (calculate the length of my list variable as user_names)
  name  = var.user_names[count.index]   # create all 3 users inside aws console using count.index
}

variable "user_names" {                
  description = "IAM usernames"
  type        = list(string)            # collection of data types (what kind of list it is - string number boolean)
  default     = ["user1", "user2", "user3s"]
}
