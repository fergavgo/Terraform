resource "aws_vpc" "VPC_DEV" {
  cidr_block           = "192.168.200.0/24"
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "VPC_DEV"
  }
}


resource "aws_subnet" "subnet_dev" {
  vpc_id            = aws_vpc.VPC_DEV.id
  cidr_block        = "192.168.200.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "subnet_dev"
  }
}

resource "aws_eip" "public_ip" {
  instance = aws_instance.ec2_dev.id
  domain   = "vpc"
}


resource "aws_internet_gateway" "ec2_gateway" {
  vpc_id = aws_vpc.VPC_DEV.id

  tags = {
    Name = "ec2_gateway"
  }
}


resource "aws_route_table" "EC2_Route_Table" {
  vpc_id = aws_vpc.VPC_DEV.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ec2_gateway.id
  }

  tags = {
    Name = "EC2RouteTable"
  }
}


resource "aws_route_table_association" "route_table_association" {
  subnet_id     = aws_subnet.subnet_dev.id
  route_table_id = aws_route_table.EC2_Route_Table.id
}