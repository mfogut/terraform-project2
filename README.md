# In this project we will achieve diagram with Terraform v0.14.2 (IaC).
![](VPC%20diagram.jpg)

- 1 - Create provider file and add "aws" as a provider. See "provider.tf"
- 2 - Create VPC on AWS. See "vpc.tf"
- 3 - Create two public subnets, assign public ip adress. See "public-subnets.tf"
    - Cidr block --> Created variable for Cidr block. See "variables.tf" Logical ID : "public_subnet_cidr_block"
    - Availability Zone --> Collected avaiable AZs from AWS(See data.tf Logical ID: AZs). See "locals.tf"
- 4 - Create 4 private subnets (2 for App Servers, 2 for DB Servers). See "private-subnets.tf" and "db-subnets.tf"
- 5 - Create IGW and Public-RT and configure the Route and Subnet association. See "igw_route_tables.tf"
    - Destination for Route : 0.0.0.0/0
    - Target for Route      : Internet Gateway ID
- 6 - Create NAT Gateway and allocate elastic ip address to NAT.
    - First get EIP from AWS use resource "aws_eip"
