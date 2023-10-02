variable "ami_value" {
  description = "The value for AMI"
  default     = "ami-053b0d53c279acc90"
}
variable "instance_type_value" {
  description = "The value for instance type"
  default     = "t2.micro"
}

variable "vpc_cidr" {
  description = "The value for vpc cidr"
  default     = "10.0.0.0/16"
}
