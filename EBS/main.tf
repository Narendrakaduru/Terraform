terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.19.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}

resource "aws_ebs_volume" "MyEBS_Vol" {
  availability_zone = "us-east-1a"
  size              = 5

  tags = {
    Name = "MyEBS_Vol"
  }
}

resource "aws_ebs_snapshot" "MyEBS_Vol_Snap" {
  volume_id = aws_ebs_volume.MyEBS_Vol.id

  tags = {
    "Name" = "MyEBS_Vol_Snap"
  }
}

resource "aws_ebs_snapshot_copy" "MyEBS_Vol_Snap_copy" {
  source_snapshot_id = aws_ebs_snapshot.MyEBS_Vol_Snap.id
  source_region      = "us-east-1"

  tags = {
    "Name" = "MyEBS_Vol_Snap_copy"
  }
}
