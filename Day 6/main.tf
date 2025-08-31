provider "aws" {
  region = "us-east-1"
}
resource "aws_eip" "datacenter" {
    domain = "vpc"
    tags ={
        Name = "datacenter-eip"
    }
  
}
