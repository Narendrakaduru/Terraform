variable "instance_count" {
  default = 3
}

variable "project_name" {
  type = string
  default = "My"
}

variable "My_VPC" {
  type = string
  default = "vpc-05b9fdc09ae2566a3"
}

variable "subnets" {
  type    = list(string)
  default = ["subnet-0d9d669d0c60f644b", "subnet-0b69f66408628ca2d", "subnet-044c827b6eb25743e"]
}

variable "ports_to_open" {
  type = list(number)
  default = [22, 80, 443, 8080, 9000, 3000]
}

variable "cidr_blocks" {
  description = "CIDR blocks rule"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}