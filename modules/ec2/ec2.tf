#### Backend Server ####
resource "aws_instance" "backend" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.vpc_security_group_ids

  root_block_device {
    volume_size = var.volume_size
  }

  tags = var.tags
  user_data = var.user_data
}

