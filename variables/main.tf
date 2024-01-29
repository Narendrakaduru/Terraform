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

# Create a security group
resource "aws_security_group" "example_sg" {
  name        = "example_sg"
  description = "Example security group for an EC2 instance"
}

# Create an ingress rule for SSH traffic
resource "aws_security_group_rule" "example_ssh_ingress" {
  security_group_id = aws_security_group.example_sg.id

  type        = "ingress"
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]  # Allow SSH access from anywhere (for demonstration purposes)
}

# Create an ingress rule for HTTP traffic
resource "aws_security_group_rule" "example_http_ingress" {
  security_group_id = aws_security_group.example_sg.id

  type        = "ingress"
  from_port   = 80
  to_port     = 80
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]  # Allow HTTP access from anywhere (for demonstration purposes)
}

# Create an ingress rule for Jenkins traffic
resource "aws_security_group_rule" "example_jenkins_ingress" {
  security_group_id = aws_security_group.example_sg.id

  type        = "ingress"
  from_port   = 8080
  to_port     = 8080
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]  # Allow Jenkins access from anywhere (for demonstration purposes)
}

# Create an ingress rule for sonar traffic
resource "aws_security_group_rule" "exampl_sonar_ingress" {
  security_group_id = aws_security_group.example_sg.id

  type        = "ingress"
  from_port   = 9000
  to_port     = 9000
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]  # Allow Jenkins access from anywhere (for demonstration purposes)
}

# Create an egress rule for all outbound traffic
resource "aws_security_group_rule" "example_egress" {
  security_group_id = aws_security_group.example_sg.id

  type        = "egress"
  from_port   = 0
  to_port     = 0
  protocol    = "-1"  # -1 represents all protocols
  cidr_blocks = ["0.0.0.0/0"]  # Allow traffic to all destinations
}

resource "aws_instance" "Demo-1" {
  ami                    = var.ubuntu_ami
  instance_type          = var.vm_type
  key_name               = var.demo_key
  subnet_id              = var.my_subnet
  vpc_security_group_ids = [aws_security_group.example_sg.id]
  root_block_device {
    volume_size           = var.root_volume_size
    volume_type           = var.my_volume_type
    delete_on_termination = true
    tags = {
      Name = "Demo1-root-block"
    }
  }
  user_data = <<-EOF
    #!/bin/bash
    sudo apt update && sudo apt upgrade -y
    sudo mkfs -t ext4 /dev/xvdf
    sudo mkdir /app
    sudo mount /dev/xvdf /app
    echo "/dev/xvdf /app ext4 defaults,nofail 0 2" | sudo tee -a /etc/fstab
    EOF
  tags = {
    Name = "Test-Instance-1"
  }

}

resource "aws_ebs_volume" "demo_volume" {
  availability_zone = var.availability_zone
  size              = 5
  type              = "gp2" # You can adjust the volume type as needed
  tags = {
    Name = "Demo-Volume"
  }
}

resource "aws_volume_attachment" "attach_demo_volume" {
  device_name = "/dev/sdf" # Adjust the device name as needed
  instance_id = aws_instance.Demo-1.id
  volume_id   = aws_ebs_volume.demo_volume.id
}
