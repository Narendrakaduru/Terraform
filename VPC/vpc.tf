################################################################################
# Virtual private cloud (VPC)
################################################################################

module "vpc" {
  source     = "terraform-aws-modules/vpc/aws//examples/complete"
  version    = "5.1.2"
  name       = var.vpc_name
  cidr_block = var.vpc_cidr
}
