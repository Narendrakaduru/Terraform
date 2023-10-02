variable "images" {
  type = map(string)
  default = {
    ubuntu_image       = "ami-053b0d53c279acc90"
    amazon_linux_image = "ami-0bb4c991fa89d4b9b"
    RHEL               = "ami-026ebd4cfe2c043b2"
  }
}

variable "instance_types" {
  type    = list(string)
  default = ["t2.small", "t2.nano", "t2.micro"]
}

variable "key_name" {
  type    = string
  default = "demo"
}

variable "subnet_ids" {
  type = map(string)
  default = {
    us-east-1a = "subnet-0357e6bdbacaf7288"
    us-east-1b = "subnet-0ca4e89ca3b18bd4d"
    us-east-1c = "subnet-0789d263c130e2508"
  }
}

variable "instance_env" {
  type    = list(string)
  default = ["Test", "Dev", "Prod"]
}

variable "my_sg" {
  type    = string
  default = "sg-07e0d9a3259678653"
}

variable "root_volume_size" {
  type    = string
  default = "8"
}

variable "my_volume_type" {
  type    = string
  default = "gp2"
}
