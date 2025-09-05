#1) The name of the security group must be devops-sg.
#2) The description must be Security group for Nautilus App Servers.
#3) Add an inbound rule of type HTTP, with a port range of 80, and source CIDR range 0.0.0.0/0.
#4) Add another inbound rule of type SSH, with a port range of 22, and source CIDR range 0.0.0.0/0.
#Ensure that the security group is created in the us-east-1 region using Terraform.


provider "aws"  {
  region = "us-east-1"
}
data "aws_vpc" "default"{
default = true
}
resource "aws_security_group" "devops_sg"{
name = "devops-sg"
description = "Security group for Nautilus App Servers"	
vpc_id = data.aws_vpc.default.id
ingress{
description = "Allow HTTP"
from_port = 80
to_port = 80
protocol = "tcp"
cidr_blocks = ["0.0.0.0/0"]
}
ingress{
description = "Allow SSH"
from_port = 22
to_port = 22
protocol = "tcp"
cidr_blocks = ["0.0.0.0/0"]
}
egress{
from_port = 0
to_port = 0
protocol = "-1"
cidr_blocks = ["0.0.0.0/0"]
}
tags = {
Name = "datacenter-sg"
}
}

