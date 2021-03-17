output "Edge-Public-DNS" {
  description = "Public FQDN as it will be known externally"
  value       = aws_instance.box.public_dns
}

output "Edge-Public-IP" {
  description = "Public IP as it will be known externally"
  value       = aws_instance.box.public_ip
}

output "SSH-Username" {
  description = "Username to log in via SSH"
  value       = "ubuntu"
}

output "SSH-Command" {
  description = "Full command to log in via SSH"
  value       = "ssh -A ubuntu@${aws_instance.box.public_ip}"
}
