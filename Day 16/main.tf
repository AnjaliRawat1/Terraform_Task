#Create an IAM policy named iampolicy_rose in us-east-1 region using Terraform. 
#It must allow read-only access to the EC2 console, 
#i.e., this policy must allow users to view all instances, AMIs, and snapshots in the Amazon EC2 console.

resource "aws_iam_policy" "iampolicy_rose" {
    name = "iampolicy_rose"
    path = "/"
    description = "This is a iam policy"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
    {
        Effect = "Allow"
        Action = [
            "ec2:DescribeInstances",
            "ec2:DescribeImages",
            "ec2:DescribeSnapshots"
        ]
            Resource ="*"
            
    }
    ]
})
}
