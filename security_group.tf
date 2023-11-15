# Security group for the instance

resource "aws_security_group" "allow-ssh-http" {
  name        = "allow-http-ssh-from-everywhere"
  description = "allow http and ssh from everywhere"

  dynamic "ingress" {
    for_each = var.ingress_ports
    iterator = ports
    content {
      description = "allow ${ports.key} from everywhere"
      from_port   = ports.value
      to_port     = ports.value
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
    Name = "allow-http-ssh"
  }
}