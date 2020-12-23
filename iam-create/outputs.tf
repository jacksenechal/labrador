output "terraform-user-credential" {
  value = {
    secret_access_key = aws_iam_access_key.tf_user.secret,
    access_key        = aws_iam_access_key.tf_user.id
  }
}

output "terraform-user-arn" {
  value = aws_iam_user.tf_user.arn
}

output "terraform-role-arn" {
  value = aws_iam_role.terraform_role.arn
}
