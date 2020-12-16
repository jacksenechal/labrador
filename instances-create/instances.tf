
resource "aws_key_pair" "first-contact" {
  key_name   = var.first-contact["name"]
  public_key = file(var.first-contact["path"])
}

resource "aws_instance" "apps" {
  count                  = 4
  ami                    = "ami-00430184c7bb49914"
  instance_type          = "t2.micro"
  subnet_id              = element(var.subnet_ids, count.index)
  vpc_security_group_ids = ["sg-099d4e6e", "sg-c79f4ca0"]
  key_name               = aws_key_pair.first-contact
  
  tags = {
    Name        = "app${count.index + 1}-bigmaven"
    Environment = "doit"
  }

}
