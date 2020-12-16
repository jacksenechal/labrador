
resource "aws_key_pair" "first-contact" {
  key_name   = var.first-contact["name"]
  public_key = file(var.first-contact["path"])
}

resource "aws_instance" "apps" {
  count                  = var.instances
  ami                    = var.ami-id
  instance_type          = var.instance-type
  subnet_id              = element(var.subnet_ids, count.index)
  vpc_security_group_ids = var.instance-sg
  key_name               = aws_key_pair.first-contact.key_name

  tags = {
    Name        = "app${count.index + 1}-bigmaven"
    Environment = "doit"
  }

}
