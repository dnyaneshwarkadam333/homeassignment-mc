resource "aws_iam_role" "ec2_service" {
  name = "ec2_service_role"

  assume_role_policy = "${file("iam/resources/ec2_service_role.json")}"
}

resource "aws_iam_role_policy" "ec2_service" {
  name = "ec2_service_role_policy"
  role = "${aws_iam_role.ec2_service.name}"

  policy = "${file("iam/resources/ec2_service_role_policy.json")}"
}

resource "aws_iam_instance_profile" "app" {
  name = "ec2_app_instance_profile"
  role = "${aws_iam_role.app_instance.name}"
}


data "template_file" "instance_profile" {
  template = "${file("iam/templates/instance-profile-policy.tpl")}"

  vars = {
    app_log_group_arn = "${var.app_log_group_arn}"
    ec2_log_group_arn = "${var.ec2_log_group_arn}"
  }
}


