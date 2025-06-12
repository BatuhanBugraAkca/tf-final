resource "aws_db_subnet_group" "this" {
  name       = "${var.db_identifier}-subnet-group"
  subnet_ids = var.subnet_ids

  tags = {
    Name = "${var.db_identifier}-subnet-group"
  }
}


resource "aws_db_instance" "db" {
  identifier        = var.db_identifier
  allocated_storage = var.allocated_storage
  engine            = var.engine
  instance_class    = var.instance_class
  db_name              = var.db_name
  username          = var.db_username
  password          = var.db_password
  vpc_security_group_ids = [var.db_security_group_id]
  db_subnet_group_name   = var.db_subnet_group
  skip_final_snapshot    = true
  deletion_protection = false
}
