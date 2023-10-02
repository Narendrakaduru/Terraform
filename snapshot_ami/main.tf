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


resource "aws_ebs_snapshot" "example_snapshot" {
  volume_id = aws_instance.Demo1.root_block_device[0].volume_id

  tags = {
    Name = "example_snapshot"
  }
}

resource "aws_ami" "example_ami" {
  name                = "terraform-example"
  virtualization_type = "hvm"
  root_device_name    = "/dev/xvda"
  imds_support        = "v2.0" # Enforce usage of IMDSv2. You can safely remove this line if your application explicitly doesn't support it.
  ebs_block_device {
    device_name = "/dev/xvda"
    snapshot_id = aws_ebs_snapshot.example_snapshot.id
    volume_size = 8
  }
  tags = {
    "Name" = "example_ami"
  }
}

resource "aws_ami_copy" "example_ami_copy" {
  name              = "AMI_Copy"
  description       = "A copy of ami taken from instance"
  source_ami_id     = aws_ami.example_ami.id
  source_ami_region = "us-east-1"

  tags = {
    "Name" = "AMI_Copy"
  }
}
