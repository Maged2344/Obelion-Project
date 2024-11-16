# MySQL RDS Database in Private Subnets
resource "aws_db_instance" "mysql" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "8.0"             # Use the default MySQL 8.0 version
  instance_class       = "db.t3.micro"     # Updated instance class
  db_name              = "ecommerce_db"
  username             = var.db_username
  password             = var.db_password
  publicly_accessible  = false
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  db_subnet_group_name   = aws_db_subnet_group.rds_subnet_group.name
  skip_final_snapshot     = false
  final_snapshot_identifier = "my-database-final-snapshot"

  tags = {
    Name = "MySQL-RDS"
  }
}


# RDS Subnet Group
resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "rds-subnet-group"
  subnet_ids = [aws_subnet.private_subnet_a.id, aws_subnet.private_subnet_b.id]

  tags = {
    Name = "RDSSubnetGroup"
  }
}

# Private Subnet A for RDS
resource "aws_subnet" "private_subnet_a" {
  vpc_id            = aws_vpc.custom_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "PrivateSubnetA"
  }
}

# Private Subnet B for RDS in a different Availability Zone
resource "aws_subnet" "private_subnet_b" {
  vpc_id            = aws_vpc.custom_vpc.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "PrivateSubnetB"
  }
}