variable "aws_region" {
  description = "The AWS region for creating the infrastructure"
  default = "eu-central-1"
}

variable "key_name" {
  description = "Name of the AWS key pair to use"
  default = "ec2-demo-server"
}



variable "ec2_log_level" {
  description = "The ec2 log level"
  default = "info"
}

variable "admin_cidr_ingress" {
  default = "0.0.0.0/0"
}

variable "mastercard-home-ass_admin_username" {
  description = "mastercard-home-ass Admin Username"
  default = "admin"
}

variable "mastercard-home-ass_admin_password" {
  description = "mastercard-home-ass Admin Password"
  default = "P@ssw0rd"

}

variable "public_dns_name" {
  description = "The public-facing DNS name"
  default = "mastercard-home-ass.com"
}

variable "zone_name" {
  description = "The DNS zone name"
  default = "mastercard-home-ass.com"
}

