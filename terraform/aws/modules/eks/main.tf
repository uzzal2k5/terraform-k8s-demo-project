module "vpc" {
  source = "./modules/vpc"
}

# EKS Cluster Module for Multi-AZ Deployment

resource "aws_eks_cluster" "eks" {
  name     = var.cluster_name
  role_arn = aws_iam_role.eks_cluster.arn

  vpc_config {
    subnet_ids = var.subnet_ids
  }

  version = var.cluster_version
}

resource "aws_eks_node_group" "eks_nodes" {
  for_each = toset(var.subnet_ids)

  cluster_name    = aws_eks_cluster.eks.name
  node_group_name = "node-group-${each.key}"
  node_role_arn   = aws_iam_role.eks_nodes.arn
  subnet_ids      = [each.key]
  instance_types  = [var.node_instance_type]

  scaling_config {
    desired_size = 1
    max_size     = 1
    min_size     = 1
  }
}

resource "aws_iam_role" "eks_cluster" {
  name = "eks-cluster-role"

  assume_role_policy = jsonencode({
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "eks.amazonaws.com"
      }
    }]
    Version = "2012-10-17"
  })
}

resource "aws_iam_role" "eks_nodes" {
  name = "eks-node-role"

  assume_role_policy = jsonencode({
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
    Version = "2012-10-17"
  })
}

