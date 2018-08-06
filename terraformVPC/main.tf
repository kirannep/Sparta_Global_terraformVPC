provider "aws"{
  region = "eu-west-1"
}
#launch an aws instance
resource "aws_instance" "kiran-instance"{
  ami="ami-00022549374f2bcc6"
  instance_type = "t2.micro"
  tags{
  Name = "kiran-app"
  }
}
resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "dedicated"

  tags {
    Name = "kiran-vpc"
  }
}
resource "aws_subnet" "main" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "10.0.1.0/24"

  tags {
    Name = "kiran-subnet"
  }
}
