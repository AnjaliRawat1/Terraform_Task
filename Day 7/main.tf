provider "aws" {
  region = "us-east-1"   # Change if needed
}

# Generate RSA private key
resource "tls_private_key" "devops_kp" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

# Create AWS key pair
resource "aws_key_pair" "devops_kp" {
  key_name   = "devops-kp"
  public_key = tls_private_key.devops_kp.public_key_openssh
}

# Fetch default VPC
data "aws_vpc" "default" {
  default = true
}

# Fetch default security group inside default VPC
data "aws_security_group" "default" {
  name   = "default"
  vpc_id = data.aws_vpc.default.id
}

# Launch EC2 instance
resource "aws_instance" "devops_ec2" {
  ami                    = "ami-0c101f26f147fa7fd"
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.devops_kp.key_name
  vpc_security_group_ids = [data.aws_security_group.default.id]

  tags = {
    Name = "devops-ec2"
  }
}

# Save private key locally
resource "local_file" "private_key" {
  content  = tls_private_key.devops_kp.private_key_pem
  filename = "${path.module}/devops-kp.pem"
}
