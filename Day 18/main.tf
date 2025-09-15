#The stream should be named xfusion-stream.
#Use Terraform to create this Kinesis stream.
#The Terraform working directory is /home/bob/terraform.
resource "aws_kinesis_stream" "devops_stream" {
  name                      = "devops-stream"
  shard_count               = 1
  retention_period          = 24
  encryption_type           = "NONE"
  enforce_consumer_deletion = false

  stream_mode_details {
    stream_mode = "PROVISIONED"
  }

  tags = {
    Name = "devops-stream"
    Env  = "Dev"
  }

  lifecycle {
    ignore_changes = [
      stream_mode_details,
      enforce_consumer_deletion,
      tags,
      tags_all
    ]
  }
}

