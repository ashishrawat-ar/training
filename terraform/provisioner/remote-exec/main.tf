provider "aws" {
  region     = "ap-south-1"
  access_key = "AKIA2HZLLBFST3X2MFJC"
  secret_key = "8B7zsoigvqdXXDWhDCuGve9SLncQXn4npbrxzjyQ"
}


resource "aws_instance" "ec2_example" {

   ami           = "ami-08ee6644906ff4d6c"
   instance_type =  "t2.micro"
   key_name= "aws_key"
    vpc_security_group_ids = [aws_security_group.main.id]


  provisioner "remote-exec" {
    inline = [                     # inline -- multiple command to execute
      "touch hello.txt",
      "echo helloworld remote provisioner >> hello.txt",
    ]
  }

  connection {
      type        = "ssh"          # to copy the file securely we need to use ssh connection
      host        = self.public_ip
      user        = "ubuntu"
      private_key = file("/home/ashish.rawat/training/keys/aws/aws_key")
      timeout     = "2m"
   }
}


resource "aws_security_group" "main" {
  egress = [                               # egress resource are the default one, only need to mention cidr_blocks
    {
      cidr_blocks      = [ "0.0.0.0/0", ]
      description      = ""
      from_port        = 0
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "-1"
      security_groups  = []
      self             = false
      to_port          = 0
    }
  ]
 ingress                = [
   {
     cidr_blocks      = [ "0.0.0.0/0", ]
     description      = ""
     from_port        = 22               
     ipv6_cidr_blocks = []
     prefix_list_ids  = []
     protocol         = "tcp"
     security_groups  = []
     self             = false
     to_port          = 22
  }
  ]
}
 # in linux server when we want to ssh , we need to define inbound port 22 (needs to be open on our ec2 to copy securely on remote machine) 

resource "aws_key_pair" "deployer" {
  key_name   = "aws_key"
  public_key = "generate using ssh gen"
}
