# VPC Configuration
resource "aws_vpc" "custom_vpc" {
  cidr_block = var.vpc_cidr
  tags = var.vpc_tags
}


