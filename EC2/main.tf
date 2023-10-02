terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.19.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}

resource "aws_instance" "Demo1" {
  ami                    = "ami-053b0d53c279acc90"
  instance_type          = "t2.micro"
  key_name               = "demo"
  subnet_id              = "subnet-0357e6bdbacaf7288"
  vpc_security_group_ids = ["sg-07e0d9a3259678653"]
  root_block_device {
    volume_size           = 8
    volume_type           = "gp2"
    delete_on_termination = true
    tags = {
      Name = "Demo1-root-block"
    }
  }
  tags = {
    Name = "Test-Instance"
  }
}

