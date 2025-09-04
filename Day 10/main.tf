provider "aws" {
  region = "us-east-1"
}

# Existing volume
resource "aws_ebs_volume" "k8s_volume" {
  availability_zone = "us-east-1a"
  size              = 5
  type              = "gp2"

  tags = {
    Name = "xfusion-vol"
  }
}

# Snapshot of the existing volume
resource "aws_ebs_snapshot" "xfusion_snapshot" {
  volume_id   = aws_ebs_volume.k8s_volume.id
  description = "Xfusion Snapshot"

  tags = {
    Name = "xfusion-vol-ss"
  }
}

# Ensure snapshot is completed
data "aws_ebs_snapshot" "completed_snapshot" {
  most_recent = true

  filter {
    name   = "volume-id"
    values = [aws_ebs_volume.k8s_volume.id]
  }

  filter {
    name   = "status"
    values = ["completed"]
  }

  depends_on = [aws_ebs_snapshot.xfusion_snapshot]
}
