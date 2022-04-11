terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 1.1.0"
}

provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-04505e74c0741db8d"
  instance_type = "t2.micro"
  key_name= "aws_key"
  vpc_security_group_ids = [aws_security_group.main.id]
  user_data = file("apache2.sh")
  
  
  
  connection {
      type        = "ssh"
      host        = self.public_ip
      user        = "ubuntu"
      private_key = file("/home/ksenka/keys/aws_key")
      timeout     = "4m"
   }

  tags = {
    Name = var.instance_name
  }

  
}

resource "aws_security_group" "main" {
   name = "${var.instance_name}-sg"
  egress = [
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
    },

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
  },

  {
     cidr_blocks      = [ "0.0.0.0/0", ]
     description      = ""
     from_port        = 80
     ipv6_cidr_blocks = []
     prefix_list_ids  = []
     protocol         = "tcp"
     security_groups  = []
     self             = false
     to_port          = 80
  },

  {
     cidr_blocks      = [ "0.0.0.0/0", ]
     description      = ""
     from_port        = 443
     ipv6_cidr_blocks = []
     prefix_list_ids  = []
     protocol         = "tcp"
     security_groups  = []
     self             = false
     to_port          = 443
  }
  ]
 
}


resource "aws_key_pair" "deployer" {
  key_name   = "aws_key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCvxZgSKvZuXo73fHv2/IJLL1pDyUVUt3N5+lB2iigF2WtdNKEXqwvd/oXVfAZiYYAf3SFNhDLY2aSaAuofE7c426YyMyqtdPs6bvNupVUadwpLXC7sbHMORbEQmIKx3XxK1NytWp4N5g5bqK8H6SQW/2dPrFHCIXklaEOY7MGTqHErbmmoRVI+lKh6fSVdchC6KGp0lRQJFZ33MUyiVAryMpQuGApUw0bPwr6hbB2SXY//y5DFh7whivpt2AVUJT3asZ7WwagEEOToJeUSZruDSCqohl1hEEYY+klWvM3GjEd6GJBfikmukHCLzecFwHqo3RDuol98ce3g12TbZ/mJ ksenka@ksenka-LIFEBOOK-S752"
}
