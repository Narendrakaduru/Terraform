variable "elb_name" {
  type    = string
  default = "mycloudelb"
}

variable "elb_az_names" {
  type    = list(string)
  default = ["us-east-1a", "us-east-1b"]
}

variable "elb_timeout" {
  type    = number
  default = 200
}
