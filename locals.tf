locals {
  az_names = data.aws_availability_zones.AZs.names
}

locals {
  app_server_subnets = [aws_subnet.private_subnet_a.id, aws_subnet.private_subnet_b.id]
}

locals {
  app_servers = [aws_instance.app_server_a.id, aws_instance.app_server_b.id]
}
