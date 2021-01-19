# An Elastic IP per public subnet
resource "aws_eip" "nat_a" {
  vpc = true
}

resource "aws_eip" "nat_b" {
  vpc = true
}

resource "aws_eip" "nat_c" {
  vpc = true
}

# A NAT Gateway per public subnet
resource "aws_nat_gateway" "ngw_a" {
  allocation_id = aws_eip.nat_a.id
  subnet_id     = aws_subnet.public_a.id

  tags = merge(local.common_tags, {
  Name = "nat-gw-a" })
}

resource "aws_nat_gateway" "ngw_b" {
  allocation_id = aws_eip.nat_b.id
  subnet_id     = aws_subnet.public_b.id

  tags = merge(local.common_tags, {
  Name = "nat-gw-b" })
}

resource "aws_nat_gateway" "ngw_c" {
  allocation_id = aws_eip.nat_c.id
  subnet_id     = aws_subnet.public_c.id

  tags = merge(local.common_tags, {
  Name = "nat-gw-c" })
}
