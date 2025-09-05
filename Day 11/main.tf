provider "aws" {
  region = "ap-south-1" # change if needed
}

# CloudWatch Alarm
resource "aws_cloudwatch_metric_alarm" "nautilus_alarm" {
  alarm_name          = "nautilus-alarm"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1                 # single evaluation period
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 300               # 300 seconds = 5 minutes
  statistic           = "Average"
  threshold           = 80
  alarm_description   = "Alarm when EC2 CPU exceeds 80%"
}
