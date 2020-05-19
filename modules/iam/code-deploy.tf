resource "aws_iam_role" "cd-role" {
  name = "${local.resrc_prefix_nm}-cd-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "codedeploy.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

  tags = {
    Name          = "${local.resrc_prefix_nm}-cd-role"
    Environment   = var.environment
  }
}