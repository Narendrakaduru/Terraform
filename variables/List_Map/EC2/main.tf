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

locals {
  common_tags = {
    Manager = "Harish"
    owner   = "Narendra"
  }
}
resource "aws_instance" "Demo" {
  ami                    = var.images["ubuntu_image"]
  instance_type          = var.instance_types[2]
  key_name               = var.key_name
  subnet_id              = element(values(var.subnet_ids), count.index)
  vpc_security_group_ids = [var.my_sg]
  count                  = length(var.subnet_ids)
  root_block_device {
    volume_size           = var.root_volume_size
    volume_type           = var.my_volume_type
    delete_on_termination = true
    tags = {
      Name = "Demo-root-block"
    }
  }
  tags = merge(
    local.common_tags,
    {
      Name = "AppID-Instance-${element(var.instance_env, count.index)}"
      env  = element(var.instance_env, count.index)
  })
}
