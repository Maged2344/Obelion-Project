variable "vpc_cidr" {
  
}
variable "vpc_tags" {
  default = {
    Name = "VPC"
  }
}
variable "private_subnets" {
  default = [{}]
}
variable "public_subnets" {
  default = [{}]
}