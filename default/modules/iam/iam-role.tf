resource "aws_iam_instance_profile" "ec2-role_profile" {
  name =  "codedeploy-ec2-role-profile"
  role =  aws_iam_role.codedeploy-ec2-role.name
}

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
    Name          = "${var.resrc_prefix_nm}-ec2-role"
    Environment   = var.environment
  }
}

resource "aws_iam_role_policy_attachment" "ec2-role-attach-cd" {
  role        = aws_iam_role.codedeploy-ec2-role.name
  policy_arn  = "arn:aws:iam::aws:policy/AWSCodeDeployFullAccess"
}

resource "aws_iam_role_policy_attachment" "ec2-role-attach-s3" {
  role        = aws_iam_role.codedeploy-ec2-role.name
  policy_arn  = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
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
    Name          = "${var.resrc_prefix_nm}-codedeploy-role"
    Environment   = var.environment
  }
}

resource "aws_iam_role_policy_attachment" "cd-role-attach" {
  role        = aws_iam_role.codedeploy-role.name
  policy_arn  = "arn:aws:iam::aws:policy/service-role/AWSCodeDeployRole"
}