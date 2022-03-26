resource "aws_db_instance" "tf_24" {
  identifier = "my-test-database"
  allocated_storage    = 20
  storage_type = "gp2"
  engine               = "postgres"
  engine_version       = "12"
  instance_class       = "db.t2.micro"
  port                 = "5432"
  name                 = var.database
  username             = var.username
  password             = var.password
  parameter_group_name = "default.postgres12"
  skip_final_snapshot  = true


  tags = {
      Name = "tf_24_database"
  }
}