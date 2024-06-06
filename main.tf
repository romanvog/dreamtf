terraform {
  cloud {
    organization = "dreamapp"

    workspaces {
      name = "dreamapp"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "dreamapp" {
  ami           = "ami-04b70fa74e45c3917"
  instance_type = "t2.micro"
  key_name      = "dreamapp"
  vpc_security_group_ids = [aws_security_group.allow_http.id,aws_security_group.allow_ssh.id,aws_security_group.allow_outbound.id]

  tags = {
    Name = "dreamapp"
  }

  user_data  = "${file("install_dependencies.sh")}"
}

resource "aws_security_group" "allow_http" {
  name        = "allow-http"
  description = "Allow inbound HTTP traffic"
  vpc_id      = "vpc-00a18f292f5fe509f"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "allow_ssh" {
  name        = "allow-ssh"
  description = "Allow SSH"
  vpc_id      = "vpc-00a18f292f5fe509f"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "allow_outbound" {
  name        = "allow_outbound"
  description = "Allow outbound traffic"
  vpc_id      = "vpc-00a18f292f5fe509f"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
