terraform {
  backend "remote" {
    organization = "oamapp-org"
    workspaces {
      name = "Example-Workspace"
    }
}
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27.0"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

data "aws_ssm_parameter" "ami" {
  name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-ebs"
}

resource "aws_instance" "app_server" {
  ami           = data.aws_ssm_parameter.ami.value
  instance_type = "t2.micro"
}