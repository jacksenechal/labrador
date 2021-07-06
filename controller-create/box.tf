
resource "aws_key_pair" "first-contact" {
  key_name   = var.first-contact["name"]
  public_key = file(var.first-contact["path"])
}

resource "aws_instance" "box" {
  ami                         = "ami-0133f33c119ae8655"
  instance_type               = var.instance-type
  subnet_id                   = element(var.subnet_ids, 0)
  vpc_security_group_ids      = [aws_security_group.tfcontroller.id]
  key_name                    = aws_key_pair.first-contact.key_name
  associate_public_ip_address = true
  iam_instance_profile        = aws_iam_instance_profile.controller_profile.name

  tags = merge(local.common_tags, {
    Name = var.instance-tag-name
    Environment = "Do IT"
  })

  provisioner "remote-exec" {
    inline = ["echo 'Ready to grant you one wish'"]
    connection {
      type = "ssh"
      user = "ubuntu"
      host = self.public_ip
    }
  }

  /* provisioner "local-exec" { */
  /*   command = "ansible-playbook --extra-vars 'target_hosts=tag_Name_${self.tags.Name} hostname=${self.tags.Name}' ansible/terraform-controller.yaml" */
  /* } */

  /* provisioner "local-exec" { */
  /*   command = "ansible-playbook --extra-vars 'target_hosts=tag_Name_${self.tags.Name} hostname=${self.tags.Name}' ansible/vault-controller.yaml" */
  /* } */
}
