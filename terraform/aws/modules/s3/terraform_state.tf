# Create S3 bucket for Terraform state
resource "aws_s3_bucket" "terraform_state" {
  bucket = "terraform-state-bucket" # Change to a globally unique name

  lifecycle {
    prevent_destroy = true
  }

  tags = {
    Name        = "Terraform State Bucket"
  }
}
