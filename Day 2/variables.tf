variable "vpc_name" {
  description = "The instance type to use for the EC2 instances"
  default     = "My-VPC"
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "private_subnets" {
  default = {
    "private_subnet_1" = 1
    "private_subnet_2" = 2
  }
}

variable "public_subnets" {
  default = {
    "public_subnet_1" = 1
    "public_subnet_2" = 2
  }
}

variable "region" {
  description = "The AWS region to deploy the EC2 instances in"
  default     = "us-west-2"
}

variable "ami" {
  description = "The AMI ID to use for the EC2 instances"
  default     = "ami-0cf2b4e024cdb6960"
}

variable "instance_type" {
  description = "The instance type to use for the EC2 instances"
  default     = "t2.micro"
}
