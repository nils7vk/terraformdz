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

# resource "aws_instance" "tf_24" {
#   ami = data.aws_ami.amazon_linux.id
#   instance_type = "t2.micro"

#   tags = {
#     Name = "HelloWorld"
#   }
#   volume_tags = {
#     "Owner" = "terraform"
#   }
# }
# data "aws_ami" "amazon_linux" {
#   most_recent = true

#   filter {
#     name = "name"
#     values = ["amzn2-ami-kernel-5.10-hvm-*-x86_64-gp2"]
#   }
#   owners = ["amazon"]
# }

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