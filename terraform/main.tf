provider "aws" {
  region = "us-east-2"
}

# 🔍 Fetch latest Ubuntu 22.04 AMI
data "aws_ami" "ubuntu" {
  most_recent = true

  owners = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# 🚀 EC2 Instance
resource "aws_instance" "k8s_node" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.medium"
  key_name      = "practise"

  tags = {
    Name = "k8s-node"
  }
}
