# module "eks" {
#   source  = "terraform-aws-modules/eks/aws"
#   version = "~> 20.31"

#   cluster_name    = var.project_name
#   cluster_version = "1.33"

#   # Optional
#   cluster_endpoint_public_access = true

#   # Optional: Adds the current caller identity as an administrator via cluster access entry
#   enable_cluster_creator_admin_permissions = true

#   subnet_ids = module.vpc.private_subnets
#   vpc_id     = module.vpc.vpc_id

#   enable_irsa    = true
#   create_kms_key = true

#   fargate_profiles = {
#     app_profile = {
#       name = "app-profile"
#       selectors = [
#         {
#           namespace = "app"
#         }
#       ]
#     }
#   }

#   tags = {
#     Terraform   = "true"
#     Environment = var.environment
#   }
# }
