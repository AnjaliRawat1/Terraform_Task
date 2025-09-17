#The topic name should be xfusion-notifications.
#Use Terraform to create this SNS topic. 
#The Terraform working directory is /home/bob/terraform. 
#Create the main.tf file (do not create a different .tf file) to accomplish this task.

resource "aws_sns_topic" "xfusion_notifications" {
    name = "xfusion-notifications"
  }
