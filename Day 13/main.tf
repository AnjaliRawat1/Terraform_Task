# The name of the S3 bucket must be xfusion-s3-1506.
# The S3 bucket must block all public access, making it a private bucket.
resource "aws_s3_bucket" "devops" {
    bucket = "xfusion-s3-1506"
    tags = {
      Name = "xfusion-s3-1506"
    }  
}
resource "aws_s3_bucket_public_access_block" "blockpublic" {
  bucket = aws_s3_bucket.devops.id
  block_public_acls = true
  block_public_policy = true
  ignore_public_acls = true
  restrict_public_buckets = true
}
