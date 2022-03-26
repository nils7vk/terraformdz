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

data "aws_vpcs" "my_vpcs" {}

output "aws_vpcs" {
  value = data.aws_vpcs.my_vpcs.ids
}

data "aws_subnets" "my_sub" {}
output "aws_subnets" {
  value = data.aws_subnets.my_sub.ids
}

data "aws_security_groups" "my_sg" {
  tags = {
    Name = "*"
  }
}
output "aws_security_groups" {
  value = data.aws_security_groups.my_sg.ids
}