# Provider Configuration
provider "aws" {
  region = var.aws_region

}

terraform {
  backend "s3" {
    bucket         = "obelion-terraform-state-file"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "obelion-terraform-lock"

  }
}


