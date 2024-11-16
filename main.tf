module "networking" {
  source   = "./modules/networking"
  vpc_cidr = "10.0.0.0/16"
  public_subnets = [
    {
      name              = "public_subnet_1a"
      cidr_block        = "10.0.1.0/24"
      availability_zone = "us-east-1a"
    },

  ]
  private_subnets = [
    {
      name              = "private_subnet_1a"
      cidr_block        = "10.0.2.0/24"
      availability_zone = "us-east-1a"
    },
    {
      name              = "private_subnet_1b"
      cidr_block        = "10.0.3.0/24"
      availability_zone = "us-east-1b"
    },
  ]
}


####   backend  #####
module "backend_ec2" {
  source                 = "./modules/ec2"
  subnet_id              = module.networking.public_subnets["public_subnet_1a"].id
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  tags = {
    name       = "back-end"
    created_by = "terraform"

  }
  depends_on = [module.networking]
  user_data  = <<-EOF
            #!/bin/bash
            sudo apt-get update
            sudo apt-get install -y docker.io docker-compose
            sudo systemctl start docker
            sudo systemctl enable docker
            sudo apt install git-all
            # Pull Laravel Docker image
            git clone https://github.com/Maged2344/backend-app
            cd backend-app
            sudo docker build -t laravel-app .
            sudo docker run -d --restart=always -p 8080:80 laravel-app
            EOF

}
#### frontend ####
module "frontend_ec2" {
  source                 = "./modules/ec2"
  subnet_id              = module.networking.public_subnets["public_subnet_1a"].id
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  tags = {
    name       = "front-end"
    created_by = "terraform"

  }
  depends_on = [module.networking]
  user_data  = <<-EOF
            #!/bin/bash
            sudo apt-get update
            sudo apt-get install -y docker.io
            sudo systemctl start docker
            sudo systemctl enable docker
            docker run -d --restart=always -p 3001:3001 -v uptime-kuma:/app/data --name uptime-kuma louislam/uptime-kuma:1
            EOF

}
