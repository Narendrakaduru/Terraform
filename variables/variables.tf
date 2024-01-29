variable "availability_zone" {
  type    = string
  default = "us-east-1a"
}

variable "ubuntu_ami" {
  type    = string
  default = "ami-0c7217cdde317cfec"
}

variable "vm_type" {
  type    = string
  default = "t2.micro"
}

variable "demo_key" {
  type    = string
  default = "test"
}

variable "my_subnet" {
  type    = string
  default = "subnet-0d9d669d0c60f644b"
}

variable "my_sg" {
  type    = string
  default = "sg-0f4511e1e5bb259ea"
}

variable "root_volume_size" {
  type    = string
  default = "8"
}

variable "my_volume_type" {
  type    = string
  default = "gp2"
}
