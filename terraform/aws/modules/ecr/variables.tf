# Define multiple ECR repositories using a list and for_each
variable "ecr_repositories" {
  type    = list(string)
}
