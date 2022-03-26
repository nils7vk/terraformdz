terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
  required_version = "~>1.0"
}

# Configure the AWS Provider
provider "aws" {
  region = "eu-central-1"
  default_tags {
    tags = {
      Owner = "terraform"
    }
  }
}

module "ec2" {
  source = "./modules/ec2"
}

module "rds" {
  source = "./modules/rds"
}