# Route Table
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.lhalla.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.lhalla.id
  }

  tags = merge(local.common_tags, {
  Name = "public-rt" })
}

resource "aws_route_table" "private_a" {
  vpc_id = aws_vpc.lhalla.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.ngw_a.id
  }

  tags = merge(local.common_tags, {
  Name = "private-rt-a" })
}

resource "aws_route_table" "private_b" {
  vpc_id = aws_vpc.lhalla.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.ngw_b.id
  }

  tags = merge(local.common_tags, {
  Name = "private-rt-b" })
}

resource "aws_route_table" "private_c" {
  vpc_id = aws_vpc.lhalla.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.ngw_c.id
  }

  tags = merge(local.common_tags, {
  Name = "private-rt-c" })
}

# Subnet - Route Table associations
resource "aws_route_table_association" "public_a" {
  subnet_id      = aws_subnet.public_a.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_b" {
  subnet_id      = aws_subnet.public_b.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_c" {
  subnet_id      = aws_subnet.public_c.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private_a" {
  subnet_id      = aws_subnet.private_a.id
  route_table_id = aws_route_table.private_a.id
}

resource "aws_route_table_association" "private_b" {
  subnet_id      = aws_subnet.private_b.id
  route_table_id = aws_route_table.private_b.id
}

resource "aws_route_table_association" "private_c" {
  subnet_id      = aws_subnet.private_c.id
  route_table_id = aws_route_table.private_c.id
}
