#Create a public S3 bucket named devops-s3-19730 using Terraform. 
#Ensure the bucket is accessible publicly once created by setting the proper ACL.

resource "aws_s3_bucket" "devops" {
    bucket = "devops-s3-19730"
     acl    = "public-read"

  tags = {
     Name = "devops-s3-19730"
     Env ="Dev"
  }
}
resource "aws_s3_bucket_public_access_block" "devops_public_access" {
  bucket                  = aws_s3_bucket.devops.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}
data "aws_iam_policy_document" "public_read" {
  statement {
    sid       = "AllowPublicReadGetObject"
    effect    = "Allow"
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
    actions = [
      "s3:GetObject"
    ]
    resources = [
      "${aws_s3_bucket.devops.arn}/*"
    ]
  }
}

resource "aws_s3_bucket_policy" "devops_policy" {
  bucket = aws_s3_bucket.devops.id
  policy = data.aws_iam_policy_document.public_read.json
}
