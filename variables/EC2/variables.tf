variable "ubuntu_ami" {
  type    = string
  default = "ami-053b0d53c279acc90"
}

variable "vm_type" {
  type    = string
  default = "t2.micro"
}

variable "demo_key" {
  type    = string
  default = "demo"
}

variable "my_subnet" {
  type    = string
  default = "subnet-0357e6bdbacaf7288"
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
