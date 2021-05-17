output "app_log_group_arn" {
    value = "${aws_cloudwatch_log_group.app.arn}"
}

output "ec2_log_group_arn" {
    value = "${aws_cloudwatch_log_group.ec2.arn}"
}

output "ec2_log_group_name" {
    value = "${aws_cloudwatch_log_group.ec2.name}"
}

output "app_log_group_name" {
    value = "${aws_cloudwatch_log_group.app.name}"
}