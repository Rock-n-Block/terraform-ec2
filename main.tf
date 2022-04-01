terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile_name
  access_key = var.aws_key_credentials.access_key
  secret_key = var.aws_key_credentials.secret_key
  
}

resource "aws_key_pair" "deployer" {
  key_name = "deployer-key"
  public_key = file(var.instance_ssh_key_file)
}

resource "aws_security_group" "app_server_sg" {
  # name = "app-serever-security-group"
  description = "Security group for instance"

  dynamic "ingress" {
    for_each = var.security_rules_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = var.instance_name
  }
}

output "aws_security_group_id" {
  description = "ID of the EC2 instance security group"
  value       = aws_security_group.app_server_sg.id
}

output "aws_security_group_name" {
  description = "ID of the EC2 instance security group"
  value       = aws_security_group.app_server_sg.name
}

resource "aws_instance" "app_server" {
  ami           = var.instance_ami
  instance_type = var.instance_type
  key_name      = aws_key_pair.deployer.key_name

  root_block_device {
    encrypted   = true
    volume_type = var.root_block_device.volume_type
    volume_size = var.root_block_device.volume_size
    tags = {
      Name = var.instance_name
      Org  = var.instance_organization
    }
  }

  tags = {
    Name = var.instance_name
    Org  = var.instance_organization
  }

  security_groups = [aws_security_group.app_server_sg.name]
}


output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.app_server.id
}

output "instance_name" {
  description = "ID of the EC2 instance"
  value       = aws_instance.app_server.tags["Name"]
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.app_server.public_ip
}
