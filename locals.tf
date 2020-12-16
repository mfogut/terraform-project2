locals {
  az_names = data.aws_availability_zones.AZs.names
}

locals {
  app_server_subnets = [aws_subnet.private_subnet_a.id, aws_subnet.private_subnet_b.id]
}
