#There is an instance named devops-ec2 and an elastic-ip named devops-ec2-eip in us-east-1 region.
# Attach the devops-ec2-eip elastic-ip to the devops-ec2 instance using Terraform only. 
#The Terraform working directory is /home/bob/terraform. 
#Update the main.tf file (do not create a separate .tf file) to attach the specified Elastic IP to the instance

# Provision EC2 instance
resource "aws_instance" "ec2" {
  ami           = "ami-0c101f26f147fa7fd"
  instance_type = "t2.micro"
  subnet_id     = "subnet-81a02889896db9dbc"
  vpc_security_group_ids = [
    "sg-9fe34314164fc9004"
  ]

  tags = {
    Name = "devops-ec2"
  }
}

# Provision Elastic IP
resource "aws_eip" "ec2_eip" {
  tags = {
    Name = "devops-ec2-eip"
  }
}

# Associate Elastic IP with EC2 instance
resource "aws_eip_association" "ec2_eip_assoc" {
  instance_id   = aws_instance.ec2.id
  allocation_id = aws_eip.ec2_eip.id
}
