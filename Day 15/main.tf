#Create an IAM group named iamgroup_kirsty using terraform.
resource "aws_iam_group" "iamgroup_kirsty"{
  name = "iamgroup_kirsty"
  path = "/"
}
