provider "aws" {
  region = "us-east-1"
}

resource "aws_ebs_volume" "nautilus_volume" {
  availability_zone = "us-east-1a"
  type              = "gp3"
  size              = 2

  tags = {
    Name = "nautilus-volume"
  }
}
