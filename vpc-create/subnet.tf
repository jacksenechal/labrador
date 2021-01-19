# Subnets
resource "aws_subnet" "public_a" {
  vpc_id                  = aws_vpc.lhalla.id
  cidr_block              = cidrsubnet(var.vpc_cidr, var.subnet_cidr_newbits, 0)
  availability_zone       = data.aws_availability_zones.available.names[0]
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-a"
  }
}

resource "aws_subnet" "public_b" {
  vpc_id                  = aws_vpc.lhalla.id
  cidr_block              = cidrsubnet(var.vpc_cidr, var.subnet_cidr_newbits, 1)
  availability_zone       = data.aws_availability_zones.available.names[1]
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-b"
  }
}

resource "aws_subnet" "public_c" {
  vpc_id                  = aws_vpc.lhalla.id
  cidr_block              = cidrsubnet(var.vpc_cidr, var.subnet_cidr_newbits, 2)
  availability_zone       = data.aws_availability_zones.available.names[2]
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-c"
  }
}

resource "aws_subnet" "private_a" {
  vpc_id            = aws_vpc.lhalla.id
  cidr_block        = cidrsubnet(var.vpc_cidr, var.subnet_cidr_newbits, 3)
  availability_zone = data.aws_availability_zones.available.names[0]

  tags = {
    Name = "private-subnet-a"
  }
}

resource "aws_subnet" "private_b" {
  vpc_id            = aws_vpc.lhalla.id
  cidr_block        = cidrsubnet(var.vpc_cidr, var.subnet_cidr_newbits, 4)
  availability_zone = data.aws_availability_zones.available.names[1]

  tags = {
    Name = "private-subnet-b"
  }
}

resource "aws_subnet" "private_c" {
  vpc_id            = aws_vpc.lhalla.id
  cidr_block        = cidrsubnet(var.vpc_cidr, var.subnet_cidr_newbits, 5)
  availability_zone = data.aws_availability_zones.available.names[2]

  tags = {
    Name = "private-subnet-c"
  }
}
