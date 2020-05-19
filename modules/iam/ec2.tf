resource "aws_iam_role" "ec2-role" {
  name = "${local.resrc_prefix_nm}-ec2-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

  tags = {
    Name          = "${local.resrc_prefix_nm}-ec2-role"
    Environment   = var.environment
  }
}