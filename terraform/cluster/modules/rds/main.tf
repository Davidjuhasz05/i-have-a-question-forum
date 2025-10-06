resource "aws_db_subnet_group" "rds_subnets" {
  name       = "${var.project_name}-rds-subnet-group"
  subnet_ids = [var.private_subnet1_id, var.private_subnet2_id]
}

resource "aws_security_group" "rds_sg" {
  name        = "${var.project_name}-rds-sg"
  description = "Allow EKS access to RDS"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = [var.private_subnet1_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_db_instance" "rds" {
  identifier           = "ihaq-rds-database"
  allocated_storage    = 20
  engine               = "postgres"
  engine_version       = "17.4"
  instance_class       = "db.t3.micro"
  db_name              = "ihaq"
  username             = "ihaquser"
  password             = "ihaq-admin"
  db_subnet_group_name = aws_db_subnet_group.rds_subnets.name
  vpc_security_group_ids = [aws_security_group.rds_sg.id]

  multi_az             = true
  skip_final_snapshot  = true
}