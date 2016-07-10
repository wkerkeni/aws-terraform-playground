variable "name" {
  default = "double"
}

variable "region" {
  default = "ap-northeast-1"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "web_instance_type" {
  default = "t2.micro"
}

variable "instance_types" {
  default = {
    m3_medium = "m3.medium"
    m3_large  = "m3.large"
  }
}

variable "spot_prices" {
  default = {
    main      = "0.1"
    m3_medium = "0.05"
    m3_large  = "0.06"
  }
}

data "aws_availability_zones" "az" {}

data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "name"
    values = ["amzn-ami-hvm-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "block-device-mapping.volume-type"
    values = ["gp2"]
  }
}
