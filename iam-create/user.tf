resource "aws_iam_user" "tf_user" {
  name = "tfauto"
  path = "/"

  tags = {
    Purpose = "Terraform Infrastructure Deployment"
    Name    = "Terraform Identity"
  }
}

resource "aws_iam_access_key" "tf_user" {
  user = aws_iam_user.tf_user.name
}

resource "aws_iam_user_policy" "tf_user_grant" {
  name = "tf_user_grant"
  user = aws_iam_user.tf_user.name

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "sts:AssumeRole"
      ],
      "Effect": "Allow",
      "Resource": "${aws_iam_role.terraform_role.arn}"
    }
  ]
}
EOF
}
