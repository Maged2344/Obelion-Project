# Internet Gateway for Public Subnet
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.custom_vpc.id

  tags = {
    Name = "InternetGateway"
  }
}

# resource "aws_nat_gateway" "nat" {
#   allocation_id = aws_eip.lb.id
#   subnet_id     = aws_subnet.public_subnet.id

#   tags = {
#     Name = "gw NAT"
#   }
#     depends_on = [aws_internet_gateway.igw]
# }

# resource "aws_eip" "lb" {
# }