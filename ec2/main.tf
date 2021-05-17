resource "aws_autoscaling_group" "app" {
    name                 = "${var.autoscaling_group_name}"
    vpc_zone_identifier = "${var.vpc_zone_identifier}"
    min_size             = "${var.autoscaling_min_size}"
    max_size             = "${var.autoscaling_max_size}"
    desired_capacity     = "${var.autoscaling_desired_size}"
    launch_configuration = "${aws_launch_configuration.app.name}"
}

data "template_file" "cloud_config" {
    template = "${file("ec2/templates/cloud-config.tpl")}"

    vars = {
        aws_region         = "${var.aws_region}"
        ec2_cluster_name   = "${var.ec2_cluster_name}"
        ec2_log_level      = "${var.ec2_log_level}"
        ec2_agent_version  = "latest"
        ec2_log_group_name = "${var.ec2_log_group_name}"
    }
}

resource "aws_launch_configuration" "app" {
    security_groups = [
        "${var.instance_sg_id}",
    ]

    key_name                    = "${var.key_name}"
    image_id                    = "${image_id}"
    instance_type               = "${var.instance_type}"
    iam_instance_profile = "${var.app_iam_instance_profile_name}"
    user_data                   = "${data.template_file.cloud_config.rendered}"
    associate_public_ip_address = true

    lifecycle {
        create_before_destroy = true
    }
}

