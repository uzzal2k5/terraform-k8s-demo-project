# EKS CLuster
output "eks_cluster_name" {
  value = module.eks.eks_cluster_id
}

output "eks_cluster_endpoint" {
#  value = aws_eks_cluster.eks.endpoint
  value = module.eks.eks_cluster_endpoint
}



# RDS Cluster
output "rds_endpoint" {
  value =module.rds.rds_endpoint
#  value = aws_db_instance.postgres.endpoint
}

