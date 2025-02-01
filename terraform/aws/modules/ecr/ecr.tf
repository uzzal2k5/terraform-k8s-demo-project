
resource "aws_ecr_repository" "ecr_repos" {
  for_each = toset(var.ecr_repositories)
  name                 = each.value
  image_tag_mutability = "MUTABLE"  # Allow image tag updates

  image_scanning_configuration {
    scan_on_push = true  # Enable automatic scanning for vulnerabilities
  }
  tags = {
    Name        = each.value
  }
}
