variable "availability_zone" {
  type    = string
  default = "us-east-1a"
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

variable "root_volume_size" {
  type    = string
  default = "8"
}

variable "my_volume_type" {
  type    = string
  default = "gp2"
}
