{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "ec2InstanceRole",
      "Effect": "Allow",
      "Action": [
        "ec2:AssignPrivateIpAddress",
        "ec2:DescribeInstance",
        "s3:PutObject",
        "s3:GetObject",
        "s3:ListBucket"

      ],
      "Resource": [
        "*"
      ]
    },
    {
      "Sid": "allowLoggingToCloudWatch",
      "Effect": "Allow",
      "Action": [
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Resource": [
        "${app_log_group_arn}",
        "${ec2_log_group_arn}"
      ]
    }
  ]
}
