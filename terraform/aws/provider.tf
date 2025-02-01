provider "aws" {
  profile=module.global.aws_profile
  region= module.global.aws_region
  shared_credentials_file = "~/.aws/creds"
}

terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 4.0"
    }
  }


}
module "global" {
  source = "./modules/global_settings"
}



