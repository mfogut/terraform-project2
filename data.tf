# Declare the data source
data "aws_availability_zones" "AZs" {
  state = "available"
}
