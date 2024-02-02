resource "aws_security_group" "My-All-SG" {
  name        = "My-Security-Group-Instance"
  description = "Open 22,443,80,8080,9000"

  ingress = [
    for port in var.ports_to_open : {
      description      = "TLS from VPC"
      from_port        = port
      to_port          = port
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.cidr_blocks
  }

  tags = {
    Name = "My-All-SG"
  }
}

resource "aws_security_group" "My-ALB-SG" {
  name        = "My-SecurityGroup-ALB"
  description = "Open 80"

  ingress  {
      description      = "Allow traffic to port 80"
      from_port        = 80
      to_port          = 80
      protocol         = "tcp"
      cidr_blocks      = var.cidr_blocks
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.cidr_blocks
  }

  tags = {
    Name = "My-ALB-SG"
  }
}