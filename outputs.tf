output "vpc_id"           { value = module.vpc.vpc_id }
output "public_subnets"   { value = module.vpc.public_subnets }
output "private_subnets"  { value = module.vpc.private_subnets }
# output "cluster_name"     { value = module.eks.cluster_name }
# output "cluster_endpoint" { value = module.eks.cluster_endpoint }
# output "fargate_profiles" { value = module.eks.fargate_profiles }