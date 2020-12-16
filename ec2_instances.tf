#Bashtion Host#################################
resource "aws_instance" "bashtion_host" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.ec2_instance_type
  subnet_id              = aws_subnet.public_subnet_a.id
  vpc_security_group_ids = [aws_security_group.bashtion_sg.id]
  key_name               = "demo"

  tags = {
    Name = "Bashtion-Host"
  }
}
################################################
#Private Subnet A App Servers
resource "aws_instance" "app_server_a" {
  ami                    = data.aws_ami.app_server.id
  instance_type          = var.ec2_instance_type
  subnet_id              = aws_subnet.private_subnet_a.id
  vpc_security_group_ids = [aws_security_group.app_server_sg.id]
  key_name               = "demo"

  tags = {
    Name = "AppServer-Host-${terraform.workspace}"
  }
}

################################################
#Private Subnet A App Servers
resource "aws_instance" "app_server_b" {
  ami                    = data.aws_ami.app_server.id
  instance_type          = var.ec2_instance_type
  subnet_id              = aws_subnet.private_subnet_b.id
  vpc_security_group_ids = [aws_security_group.app_server_sg.id]
  key_name               = "demo"

  tags = {
    Name = "AppServer-Host-${terraform.workspace}"
  }
}

####################################################
output "Bashtion_host_id" {
  value       = aws_instance.bashtion_host.id
  description = "Bastion host id"
}

output "Bashtion_host_key_pair" {
  value       = aws_instance.bashtion_host.key_name
  description = "Bastion host id"
}

output "Appserver1_host_id" {
  value       = aws_instance.app_server_a.id
  description = "Private Subnet A AppServer host id"
}

output "Appserver2_host_id" {
  value       = aws_instance.app_server_b.id
  description = "Private Subnet B AppServer host id"
}
