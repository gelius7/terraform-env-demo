# vpc

module "vpc" {
  # source = "github.com/nalbam/terraform-aws-vpc?ref=v0.12.42"
  # source = "../../../terraform-aws-vpc"

  source  = "nalbam/vpc/aws"
  version = "0.12.42"

  region = var.region
  name   = var.name

  vpc_id   = var.vpc_id
  vpc_cidr = var.vpc_cidr

  single_route_table = var.single_route_table

  enable_nat_gateway = var.enable_nat_gateway
  single_nat_gateway = var.single_nat_gateway

  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets

  tags = var.tags
}
