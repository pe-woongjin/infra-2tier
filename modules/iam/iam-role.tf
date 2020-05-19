resource "aws_iam_role" "codedeploy-ec2-role" {
  name = "codedeploy-ec2-role"

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

resource "aws_iam_role_policy_attachment" "ec2-role-attach" {
  role        = aws_iam_role.codedeploy-ec2-role.name
  policy_arn  = "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforAWSCodeDeploy"
}

resource "aws_iam_role" "codedeploy-role" {
  name = "codedeploy-role"

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
    Name          = "${local.resrc_prefix_nm}-codedeploy-role"
    Environment   = var.environment
  }
}

resource "aws_iam_role_policy_attachment" "codedeploy-role-attach" {
  role        = aws_iam_role.codedeploy-role.name
  policy_arn  = "arn:aws:iam::aws:policy/service-role/AWSCodeDeployRole"
}