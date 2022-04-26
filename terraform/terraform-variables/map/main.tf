provider "aws" {
  region     = "eu-central-1"
  access_key = "AKIA2HZLLBFST3X2MFJC"
  secret_key = "8B7zsoigvqdXXDWhDCuGve9SLncQXn4npbrxzjyQ"
}

resource "aws_instance" "ec2_example" {

   ami           = "ami-0767046d1677be5a0"
   instance_type =  "t2.micro"

   tags = var.project_environment

}


variable "project_environment" {
  description = "project name and environment"
  type        = map(string)                    # defined map variable (map always consist of key value)
  default     = {
    project     = "my-project",                # key - project
    environment = "dev"                        # value - environment
  }
}
