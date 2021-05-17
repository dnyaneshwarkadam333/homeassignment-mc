variable "instance_type" {
  description = "The ECS instance type"
  default     = "t2.medium"
}

variable "autoscaling_group_name" {
  description = "The name for the autoscaling group"
  default = "asg-mastercard-home-ass"
}
variable "autoscaling_min_size" {
  description = "The minimum number of servers in the autoscaling group"
  default     = "1"
}

variable "autoscaling_max_size" {
  description = "The maximum number of servers in the autoscaling group"
  default     = "2"
}

variable "autoscaling_desired_size" {
  description = "The desired number of servers in the autoscaling group"
  default     = "3"
}

variable "key_name" {}

variable "aws_region" {}

variable "vpc_zone_identifier" {}

variable "app_iam_instance_profile_name" {}

variable "instance_sg_id" {}


