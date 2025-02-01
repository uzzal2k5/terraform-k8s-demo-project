
resource "aws_db_instance" "postgres" {
  allocated_storage      = 20
  engine                 = "postgres"
  engine_version         = var.postgres_version
  instance_class         = var.instance_class
  name                   = var.db
  username               = var.db_user
  password               = var.db_password
  multi_az               = true
  db_subnet_group_name   = aws_db_subnet_group.rds_subnet_group.name
  vpc_security_group_ids = [aws_security_group.rds_sg.id]

  tags = {
    Name = "rds-postgres"
  }
  depends_on = [aws_security_group.rds_sg]

}


