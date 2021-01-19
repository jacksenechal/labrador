# Chief VPC
resource "aws_vpc" "lhalla" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true

  tags = merge(local.common_tags, {
  Name = "chief-vpc" })
}

# Internet Gateway
resource "aws_internet_gateway" "lhalla" {
  vpc_id = aws_vpc.lhalla.id

  tags = merge(local.common_tags, {
  Name = "chief-vpc-igw" })
}
