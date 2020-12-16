# Declare the data source
data "aws_availability_zones" "AZs" {
  state = "available"
}

#Amazon Linux 2 AMI#########################
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["aws-marketplace"]

  filter {
    name   = "name"
    values = ["Ubuntu Server 20.04 *"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

#Red Hat Enterprise Linux 8#############
data "aws_ami" "app_server" {
  most_recent = true
  owners      = ["aws-marketplace"]

  filter {
    name   = "name"
    values = ["Red Hat Enterprise Linux 8 *"]
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
