output "Apps-IPs" {
  value = {
    for instance in aws_instance.apps :
    instance.id => instance.private_ip
  }
}
