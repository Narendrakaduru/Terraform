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

resource "aws_instance" "Demo-1" {
  ami                    = var.ubuntu_ami
  instance_type          = var.vm_type
  key_name               = var.demo_key
  subnet_id              = var.my_subnet
  vpc_security_group_ids = [var.my_sg]
  root_block_device {
    volume_size           = var.root_volume_size
    volume_type           = var.my_volume_type
    delete_on_termination = true
    tags = {
      Name = "Demo1-root-block"
    }
  }
  tags = {
    Name = "Test-Instance-1"
  }
}

resource "aws_instance" "Demo-2" {
  ami                    = var.ubuntu_ami
  instance_type          = var.vm_type
  key_name               = var.demo_key
  subnet_id              = var.my_subnet
  vpc_security_group_ids = [var.my_sg]
  root_block_device {
    volume_size           = var.root_volume_size
    volume_type           = var.my_volume_type
    delete_on_termination = true
    tags = {
      Name = "Demo2-root-block"
    }
  }
  tags = {
    Name = "Test-Instance-2"
  }
}
