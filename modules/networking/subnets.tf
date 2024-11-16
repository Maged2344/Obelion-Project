# Public Subnet for EC2 instances
resource "aws_subnet" "public_subnets" {
  for_each = { for subnet in var.public_subnets : subnet.name => subnet}
  vpc_id                  = aws_vpc.custom_vpc.id
  cidr_block              = each.value.cidr_block
  map_public_ip_on_launch = try(each.value.map_public_ip_on_launch,true)
  availability_zone       = each.value.availability_zone
  tags = try(each.value.tags,{"type"="public"})
}
resource "aws_subnet" "private_subnets" {
  for_each = { for subnet in var.private_subnets : subnet.name => subnet}
  vpc_id                  = aws_vpc.custom_vpc.id
  cidr_block              = each.value.cidr_block
  availability_zone       = each.value.availability_zone
  tags = try(each.value.tags,{"type"="public"})
}


# Internet Gateway for Public Subnet
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.custom_vpc.id

  tags = {
    Name = "InternetGateway"
  }
}
 
# Route Table for Public Subnet
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.custom_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "PublicRouteTable"
  }
}

# Associate Route Table with Public Subnet
resource "aws_route_table_association" "public_association" {
 for_each = { for subnet in var.public_subnets : subnet.name => subnet}
  subnet_id      = aws_subnet.public_subnets[each.value.name].id
  route_table_id = aws_route_table.public_rt.id
}
