provider "aws" {
  region     = "ap-south-1"
  access_key = "AKIA2HZLLBFST3X2MFJC"
  secret_key = "8B7zsoigvqdXXDWhDCuGve9SLncQXn4npbrxzjyQ"
}


resource "aws_instance" "ec2_example" {

   ami           = "ami-08ee6644906ff4d6c"
   instance_type =  "t2.micro"
   count = 1

   tags = {
           Name = "Terraform EC2"
   }

}

# for_count_loop

resource "aws_iam_user" "example" {
  count = length(var.user_names)
  name  = var.user_names[count.index]    # iterate over the values ie. user1[0],2[1],3[2]
}

variable "user_names" {
  description = "IAM usernames"
  type        = list(string)          
  default     = ["user1", "user2", "user3"]
}

# for_count & for_each work with on list or map variable cos it holds more than one value



# for_each_loop

variable "user_names" {
  description = "IAM usernames"
  type        = set(string)         # for each_loop we can't use list command here
  default     = ["user1", "user2", "user3s"]
} 

resource "aws_iam_user" "example" {
  for_each = var.user_names
  name  = each.value
}
