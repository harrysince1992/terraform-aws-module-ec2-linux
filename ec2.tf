# Module to create a ec2 linux instance
# adding a comment for testing
locals {
  user_data_script_path = format("${path.cwd}/%s", var.user_data)
}

resource "aws_instance" "ec2" {
  ami = data.aws_ami.ami-id.id
  instance_type = var.instance_type
  count = var.number_of_instances
  security_groups = [aws_security_group.allow-ssh-http.name]
  key_name = aws_key_pair.generated_key.id

  associate_public_ip_address = true

  user_data = file(local.user_data_script_path)

  tags = {
    Name = "webserver-${count.index + 1}"
  }

}

data "aws_ami" "ami-id" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]
}

# Private and public key pair
resource "tls_private_key" "pvt-key" {
  algorithm = "RSA"
  rsa_bits = 4096
}

resource "aws_key_pair" "generated_key" {
  key_name   = "test-terraform-key"
  public_key = tls_private_key.pvt-key.public_key_openssh
}
