
resource "aws_key_pair" "first-contact" {
  key_name   = var.first-contact["name"]
  public_key = file(var.first-contact["path"])
}

resource "aws_instance" "box" {
  ami                         = data.aws_ami.ubuntu-20-04.id
  instance_type               = var.instance-type
  subnet_id                   = element(var.subnet_ids, 0)
  vpc_security_group_ids      = [aws_security_group.edge-of-tomorrow.id]
  key_name                    = aws_key_pair.first-contact.key_name
  associate_public_ip_address = true
  iam_instance_profile = aws_iam_instance_profile.controller_profile.name 

  tags = merge(local.common_tags, {
    Name = "edge-of-tomorrow"
  Environment = "Do IT" })
}
