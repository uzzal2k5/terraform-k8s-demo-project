# EKS Cluster Module for Multi-AZ Deployment
resource "aws_eks_cluster" "eks" {
  name     = var.cluster_name
  role_arn = aws_iam_role.eks_cluster.arn
  vpc_config {
    subnet_ids = var.subnet_ids
  }
  version = var.cluster_version
}
