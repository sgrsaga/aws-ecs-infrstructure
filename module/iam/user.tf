## full read only access
## This module is to create IAM user for GUI Access
resource "aws_iam_user" "profbob" {
  name          = var.username
  path          = "/"
  force_destroy = true
}

## Create random value for profile
resource "random_string" "sm_postfix_prof"{
  length           = 8
  special          = false
  override_special = "-"
}

resource "aws_iam_policy_attachment" "profbob-attach" {
  name       = "profbob-attach"
  users      = [aws_iam_user.profbob.name]
  policy_arn =  "arn:aws:iam::aws:policy/ReadOnlyAccess"
}

