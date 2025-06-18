#create vpc with cidr = 172.168.0.0/22 as module
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "5.1.1"

  name = "sidd-eks-fargate-vpc"
  cidr = "10.0.0.0/22"

  azs             = ["${var.region}a", "${var.region}b"]
  private_subnets = ["10.0.0.0/24", "10.0.1.0/24"]
  public_subnets  = ["10.0.2.0/24", "10.0.3.0/24"]

  enable_nat_gateway = true
  single_nat_gateway = true

  tags = {
    Terraform = "true"
    Environment = "var.environment"
  }
}