variable "aws_region" {
  default = "us-east-1"
}

variable "key_name" {
  description = "Name of the AWS key pair"
  default     = "key"
}

variable "db_username" {
  description = "Database username"
}

variable "db_password" {
  description = "Database password"
}

