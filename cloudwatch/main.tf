resource "aws_cloudwatch_log_group" "ec2" {
  name = "${var.ec2_log_group_name}"
}

resource "aws_cloudwatch_log_group" "app" {
  name = "${var.app_log_group_name}"
}
