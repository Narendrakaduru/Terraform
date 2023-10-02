provider "aws" {
  region = "us-east-1"
}
resource "aws_instance" "Test_Instance" {
  ami                    = var.ami_value
  instance_type          = var.instance_type_value
  key_name               = "demo"
  subnet_id              = aws_subnet.Public-1A.id
  vpc_security_group_ids = [aws_security_group.Terraform_SG.id]
  tags = {
    Name = "Test_Instance"
  }
}

// Create VPC 
resource "aws_vpc" "MyVpc-01" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  tags = {
    Name = "MyVpc-01"
  }
}

// Create Public subnet - 1A 
resource "aws_subnet" "Public-1A" {
  vpc_id                  = aws_vpc.MyVpc-01.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "Public-1A"
  }
}

// Create Internet Gateway
resource "aws_internet_gateway" "MyIGW" {
  vpc_id = aws_vpc.MyVpc-01.id
  tags = {
    Name = "MyIGW"
  }
}

resource "aws_route_table" "Public-RT" {
  vpc_id = aws_vpc.MyVpc-01.id

  route {
    cidr_block = "10.0.1.0/24"
    gateway_id = aws_internet_gateway.MyIGW.id
  }
  tags = {
    Name = "Public-RT"
  }
}

resource "aws_route_table_association" "Public_RT_association" {
  subnet_id      = aws_subnet.Public-1A.id
  route_table_id = aws_route_table.Public-RT.id
}

resource "aws_security_group" "Terraform_SG" {
  name        = "Terraform_SG"
  description = "Allow SSH inbound traffic"
  vpc_id      = aws_vpc.MyVpc-01.id

  ingress {
    description      = "SSH from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "Terraform_SG"
  }
}
