#The Nautilus DevOps team needs to set up CloudWatch logging for their application.
#They need to create a CloudWatch log group and log stream with the following specifications:
#The log group name should be datacenter-log-group.
#The log stream name should be datacenter-log-stream.

resource "aws_cloudwatch_log_group" "datacenter_log_group" {
  name = "datacenter-log-group"
}
resource "aws_cloudwatch_log_stream" "datacenter_log_stream" {
  name = "datacenter-log-stream"
  log_group_name = aws_cloudwatch_log_group.datacenter_log_group.name
}
