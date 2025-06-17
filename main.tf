terraform {
    required_version = ">=1.3.0"

    backend "s3" {
        bucket = "my-paypay-terraform-state-bucket"
        key = "projects/paypay-eks/envs/dev/terraform.tfstate"
        region = "ap-southeast-1"
        dynamodb_table = "paypay-terraform-locks"
        encrypt = true
    }

    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 5.0"
        }
    }
}

provider "aws" {
        region = var.region
    }