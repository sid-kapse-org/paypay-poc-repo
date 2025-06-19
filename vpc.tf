#create vpc with cidr = 172.168.0.0/22 as module
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "5.1.1"

  name = "sidd-eks-fargate-vpc"
  cidr = "10.0.0.0/21"

  azs             = ["${var.region}a", "${var.region}b"]
  private_subnets = ["10.0.0.0/24", "10.0.1.0/24"]
  public_subnets  = ["10.0.2.0/24", "10.0.3.0/24"]

  tags = {
    Terraform = "true"
    Environment = "var.environment"
  }
}

#create subnet resource
resource "aws_subnet" "subnet" {
  vpc_id     = module.vpc.vpc_id
  cidr_block = "10.0.5.0/24"


  tags = {
    Name = "sidd-eks-fargate-subnet"
  }
}
