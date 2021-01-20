
resource "aws_key_pair" "first-contact" {
  key_name   = var.first-contact["name"]
  public_key = file(var.first-contact["path"])
}

resource "aws_instance" "box" {
  ami                         = data.aws_ami.ubuntu-20-04.id
  instance_type               = var.instance-type
  subnet_id                   = element(var.subnet_ids, 0)
  vpc_security_group_ids      = [aws_security_group.tf_controller.id]
  key_name                    = aws_key_pair.first-contact.key_name
  associate_public_ip_address = true
  iam_instance_profile = aws_iam_instance_profile.controller_profile.name 

  tags = merge(local.common_tags, {
    Name = "tomorrow"
  Environment = "Do IT" })

  provisioner "local-exec" {
    command = <<EOF
aws --profile ${var.profile} ec2 wait instance-status-ok --region ${var.region2} --instance-ids ${self.id}
ansible-playbook --extra-vars 'target_hosts=tag_Name_${self.tags.Name}' ansible/terraform-controller.yaml
EOF
  }
}
