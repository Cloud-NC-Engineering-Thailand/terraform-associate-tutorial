variable "cidr_vpc" {
  description = "CIDR block for the VPC"
  default     = "10.1.0.0/16"
}

variable "cidr_subnet" {
  description = "CIDR block for the subnet"
  default     = "10.1.0.0/24"
}

variable "environment_tag" {
  description = "Environment tag"
  default     = "Learn"
}

variable "aws_region" {
  description = "The AWS region to deploy your instance"
  default     = "us-east-1"
}

variable "user_name" {
  description = "The user creating this infrastructure"
  default     = "terraform"
}

variable "user_department" {
  description = "The organization the user belongs to: dev, prod, qa"
  default     = "learn"
}

variable "aws_amis" {
  type = map
  default = {
    "us-east-1" = "ami-0739f8cdb239fe9ae"
    "us-west-2" = "ami-008b09448b998a562"
    "us-east-2" = "ami-0ebc8f6f580a04647"
  }
}
