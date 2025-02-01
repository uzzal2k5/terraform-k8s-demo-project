output "ecr_repository_urls" {
  value = { for repo in aws_ecr_repository.ecr_repos : repo.name => repo.repository_url }
  description = "ECR Repository URLs for different services"
}
