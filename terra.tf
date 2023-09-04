# Use the AWS provider
provider "aws" {
  region = "us-east-1"  # Change to your desired AWS region
}

# Define variables
variable "appName" {
  default = "calbio"
}

variable "env" {
  default = "lab"
}

variable "tagValue1" {
  default = "CalBio"
}

# Create a VPC
resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "${var.appName}-${var.env}-VPC"
    Company = var.tagValue1
    Environment = var.env
  }
}

# # Create a subnet in the VPC
# resource "aws_subnet" "example" {
#   vpc_id     = aws_vpc.example.id
#   cidr_block = "10.0.0.0/24"
#   availability_zone = "us-east-1a"  # Change to your desired availability zone
#   tags = {
#     Name = "${var.appName}-${var.env}-Subnet"
#     Company = var.tagValue1
#     Environment = var.env
#   }
# }

# # Create a security group
# resource "aws_security_group" "example" {
#   name        = "${var.appName}-${var.env}-SecurityGroup"
#   description = "Allow SSH and HTTP traffic"
#   vpc_id      = aws_vpc.example.id

#   ingress {
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]  # Allow SSH from anywhere (for demonstration purposes)
#   }

#   ingress {
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]  # Allow HTTP from anywhere (for demonstration purposes)
#   }

#   tags = {
#     Name = "${var.appName}-${var.env}-SecurityGroup"
#     Company = var.tagValue1
#     Environment = var.env
#   }
# }

# # Launch an EC2 instance in the subnet
# resource "aws_instance" "example" {
#   ami           = "ami-0c55b159cbfafe1f0"  # Use your desired AMI ID
#   instance_type = "t2.micro"  # Use your desired instance type
#   subnet_id     = aws_subnet.example.id
#   security_groups = [aws_security_group.example.name]

#   tags = {
#     Name = "${var.appName}-${var.env}-EC2Instance"
#     Company = var.tagValue1
#     Environment = var.env
#   }
# }

# # Output the public IP address of the EC2 instance
# output "ec2_instance_public_ip" {
#   value = aws_instance.example.public_ip
# }

