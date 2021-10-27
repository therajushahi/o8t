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

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "3.2.0"

  for_each = var.instance_name

  name = "instance-${each.key}"

  ami                    = "ami-0d058fe428540cd89"
  instance_type          = "t2.micro"
  key_name               = "o8t"
  monitoring             = true
  vpc_security_group_ids = ["sg-0dd47857fdbfa8773", "sg-0a80d5e083aff59d8"]
  subnet_id              = "${each.value}"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}