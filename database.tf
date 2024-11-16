# MySQL RDS Database in Private Subnets
resource "aws_db_instance" "mysql" {
  allocated_storage         = 20
  storage_type              = "gp2"
  engine                    = "mysql"
  engine_version            = "8.0"
  instance_class            = "db.t3.micro"
  db_name                   = "ecommerce_db"
  username                  = var.db_username
  password                  = var.db_password
  publicly_accessible       = false
  vpc_security_group_ids    = [aws_security_group.rds_sg.id] # Use RDS-specific SG
  db_subnet_group_name      = aws_db_subnet_group.rds_subnet_group.name
  skip_final_snapshot       = false
  final_snapshot_identifier = "my-database-final-snapshot"

  tags = {
    Name = "MySQL-RDS"
  }
  depends_on = [module.networking]
}

# RDS Subnet Group
resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "new-rds-subnet-group"
  subnet_ids = [module.networking.private_subnets["private_subnet_1a"].id, module.networking.private_subnets["private_subnet_1b"].id]

  tags = {
    Name = "RDSSubnetGroup"
  }
  depends_on = [module.networking]
}

