output "Edge-Public-DNS" {
  description = "Public FQDN as it will be known externally"
  value       = aws_instance.box.public_dns
}

output "Edge-Public-IP" {
  description = "Public IP as it will be known externally"
  value       = aws_instance.box.public_ip
}
