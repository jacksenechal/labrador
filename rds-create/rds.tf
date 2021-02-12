resource "aws_db_instance" "mysql" {
  instance_class          = var.db_instance
  engine                  = "mysql"
  engine_version          = "5.7"
  multi_az                = true
  storage_type            = "gp2"
  allocated_storage       = 20
  name                    = "mysql-rds"
  username                = "ohmy"
  password                = "TheyNeverWillFigureThisOut"
  apply_immediately       = "true"
  backup_retention_period = 10
  backup_window           = "09:46-10:16"
  db_subnet_group_name    = aws_db_subnet_group.my-rds-db-subnet.name
  vpc_security_group_ids  = [aws_security_group.my-rds-sg.id]
}
