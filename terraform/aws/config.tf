terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.8"
    }
  }
  backend "s3" {
    dynamodb_table = "terraform-locks"
    bucket         = module.global.terraform-state-bucket
    encrypt        = true
    key            = "state/terraform.tfstate"
    region         =  module.global.aws_region
  }
}
