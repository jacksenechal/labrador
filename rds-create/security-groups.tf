resource "aws_db_subnet_group" "rds-db-subnet" {
  name       = "rds-db-subnet"
  subnet_ids = [var.rds_subnet1, var.rds_subnet2, var.rds_subnet3]
}

resource "aws_security_group" "rds-sg" {
  name   = "rds-sg"
  vpc_id = var.vpc_id
}
