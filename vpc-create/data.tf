# declare the data source for availability zones
data "aws_availability_zones" "available" {
  state = "available"
}

# declare a set of local general common tags
locals {
  common_tags = var.common_tags
}
