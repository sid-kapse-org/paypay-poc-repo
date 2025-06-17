variable "region" {
  description = "AWS region"
  type = string
  default = "ap-southeast-1"
}

variable "project_name" {
    description = "Unique project name"
    type = string
    default = "paypay-eks"
}

variable "environment" {
    description = "Deployment environment (dev/staging/prod)"
    type = string
    default = "dev"
}