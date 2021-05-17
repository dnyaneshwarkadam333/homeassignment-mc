output "app_iam_instance_profile_name" {
    value = "${aws_iam_instance_profile.app.name}"
}

output "ec2_iam_role_name" {
    value = "${aws_iam_role.ec2_service.name}"
}

output "ec2_service_iam_role_policy" {
    value = "${aws_iam_role.ec2_service.id}"
}