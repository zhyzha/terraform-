# provider "aws" {
#   region = "us-east-1"
# }

locals {
  vpc_cidr_block    = "10.0.0.0/16"
  subnet_cidr_block = ["10.0.1.0/24", "10.0.2.0/24"]
  subnet_az         = ["us-east-1a", "us-east-1b"]
}

resource "aws_vpc" "zhyzha_vpc" {
  cidr_block = local.vpc_cidr_block
}

resource "aws_subnet" "subnets" {
  count             = length(local.subnet_cidr_block)
  vpc_id            = aws_vpc.zhyzha_vpc.id
  cidr_block        = local.subnet_cidr_block[count.index]
  availability_zone = local.subnet_az[count.index]
}