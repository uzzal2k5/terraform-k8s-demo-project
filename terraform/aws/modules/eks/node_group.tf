# EKS Node Group
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
