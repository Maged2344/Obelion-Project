# Backend Server
resource "aws_instance" "backend" {
  ami           = "ami-0866a3c8686eaeeba" 
  instance_type = "t2.micro"
  key_name      = "key"                  
  subnet_id     = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]

  root_block_device {
    volume_size = 8
  }

  tags = {
    Name = "Back-end"
  }

   user_data = <<-EOF
              #!/bin/bash
              sudo apt-get update
              sudo apt-get install -y docker.io docker-compose
              sudo systemctl start docker
              sudo systemctl enable docker
              sudo apt install git-all
              git clone https://github.com/laravel/laravel.git /home/ubuntu/laravel
              cd /home/ubuntu/laravel
              sudo docker build -t laravel-app .
              sudo docker run -d -p 80:80 laravel-app
              EOF
}

# Frontend Server
resource "aws_instance" "frontend" {
  ami           = "ami-0866a3c8686eaeeba" 
  instance_type = "t2.micro"
  key_name      = "key"                   
  subnet_id     = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]

  root_block_device {
    volume_size = 8
  }

  tags = {
    Name = "Front-end"
  }

  user_data = <<-EOF
              #!/bin/bash
              apt update && apt upgrade -y
              EOF
}