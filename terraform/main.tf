# vpc setup

resource "aws_vpc" "lms_vpc" {
  cidr_block = "10.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_hostnames = "true"
  tags = {
    Name = "lms-vpc"
  }
}

resource "aws_subnet" "lms_public_subnet" {
  vpc_id                  = aws_vpc.lms_vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
}

resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.lms_vpc.id
}

resource "aws_route_table" "lms_public_route_table" {
  vpc_id = aws_vpc.lms_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id
  }
}

resource "aws_route_table_association" "public_subnet_association" {
  subnet_id      = aws_subnet.lms_public_subnet.id
  route_table_id = aws_route_table.lms_public_route_table.id
}
