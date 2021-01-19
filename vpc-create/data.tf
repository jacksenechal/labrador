# declare the data source for availability zones
data "aws_availability_zones" "available" {
  state = "available"
}

# declare a set of local common_tags variable
locals {
  common_tags = var.common_tags
}
