data "http" "external_ip" {
  url = "https://ifconfig.me"
}

resource "aws_security_group" "tfcontroller" {

  name        = "tfcontroller-SG"
  description = "Allow TCP/22"
  vpc_id      = var.vpc-id
  ingress {
    description = "Allow 22 from our public IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${chomp(data.http.external_ip.body)}/32"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(local.common_tags, map("Name", "tfController-SG"))
}
