output "public_subnets" {
  value = aws_subnet.public_subnets
}
output "vpc_id" {
  value = aws_vpc.custom_vpc.id
}
output "private_subnets" {
  value = aws_subnet.private_subnets
}