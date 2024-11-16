variable "ami" {
  default = "ami-0866a3c8686eaeeba"
}
variable "instance_type" {
  default = "t2.micro"
}
variable "key_name" {
  default = "key"
}
variable "subnet_id" {
  
}
variable "vpc_security_group_ids" {
  
}
variable "volume_size" {
  default = 8
}
variable "tags" {
  default = {
    Name = "prod"
  }
}
variable "user_data" {
  default = ""
}