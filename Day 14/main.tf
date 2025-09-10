#For this task, create an IAM user named iamuser_mark using terraform. 
#The Terraform working directory is /home/bob/terraform. 
#Create the main.tf file (do not create a different .tf file) 

resource "aws_iam_user" "iamuser_mark"{
name = "iamuser_mark"
path = "/"
}
