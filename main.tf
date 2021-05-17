provider "aws" {
    region = "${var.aws_region}"
}
terraform {
  required_version = "~> 0.12"
  backend "s3" {
    encrypt = true
  }
}

module "vpc" {
  source = "./vpc"

  admin_cidr_ingress = "${var.admin_cidr_ingress}"

}

module "cloudwatch" {
  source = "./cloudwatch"
}

module "iam" {
  source = "./iam"

  app_log_group_arn = "${module.cloudwatch.app_log_group_arn}"
  ec2_log_group_arn = "${module.cloudwatch.ec2_log_group_arn}"
}

module "ec2" {
  source = "./ec2"

  aws_region = "${var.aws_region}"
  key_name = "${var.key_name}"
  ec2_log_level = "${var.ec2_log_level}"
  vpc_zone_identifier = "${module.vpc.vpc_zone_identifier}"
  app_iam_instance_profile_name = "${module.iam.app_iam_instance_profile_name}"
  instance_sg_id = "${module.vpc.instance_sg_id}"
  ec2_log_group_name = "${module.cloudwatch.ec2_log_group_name}"
}

module "alb" {
  source = "./alb"

  vpc_id = "${module.vpc.vpc_id}"
  subnet_ids = "${module.vpc.public_subnet_ids}"
  security_groups = "${module.vpc.security_groups}"
  certificate_arn = "${module.dns.acm_certificate_arn}"

}

module "rds" {
  source = "./rds"

  vpc_id = "${module.vpc.vpc_id}"
  public_subnet_ids = "${module.vpc.public_subnet_ids}"
  private_subnet_ids = "${module.vpc.private_subnet_ids}"
  public_subnet_cidr = "${module.vpc.public_subnet_cidr}"
  private_subnet_cidr = "${module.vpc.private_subnet_cidr}"
  instance_security_group = "${module.vpc.instance_sg_id}"
}


module "dns" {
  source = "./dns"

  zone_name = "${var.zone_name}"
  public_dns_name = "${var.public_dns_name}"
  alb_dns_name = "${module.alb.alb_dns_name}"
  alb_zone_id = "${module.alb.alb_zone}"
}

