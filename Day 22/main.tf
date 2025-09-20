#Create a CloudFormation stack named datacenter-stack using Terraform. 
#This stack should contain an S3 bucket named datacenter-bucket-10200 as a resource, and the bucket must have versioning enabled. 

resource "aws_cloudformation_stack" "datacenter_stack" {
  name = "datacenter-stack"

  template_body = <<EOT
AWSTemplateFormatVersion: '2010-09-09'
Description: "CloudFormation stack containing an S3 bucket"
Resources:
  DatacenterBucket:
    Type: AWS::S3::Bucket
    Properties:
      BucketName: datacenter-bucket-10200
      VersioningConfiguration:
        Status: Enabled
EOT
}
