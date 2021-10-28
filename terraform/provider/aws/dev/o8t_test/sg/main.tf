terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.63.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "ap-southeast-1"
}

module "web_server_sg" {
  source = "terraform-aws-modules/security-group/aws//modules/http-5000"
  version = "4.4.0"

  name        = "web-server"
  description = "Security group for web-server with HTTP ports open to internet"
  vpc_id      = "vpc-0cf289ed605f23274"

  ingress_cidr_blocks = ["0.0.0.0/0"]
}

module "ssh_sg" {
  source  = "terraform-aws-modules/security-group/aws//modules/ssh"
  version = "~> 4.0"

  name        = "ssh"
  description = "ssh access"
  vpc_id      = "vpc-0cf289ed605f23274"

  ingress_cidr_blocks = ["0.0.0.0/0"]
}