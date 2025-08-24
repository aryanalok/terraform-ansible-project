output "instance_public_ips" {
  value = aws_instance.terra-instance[*].public_ip
}

output "instance_private_ips" {
  value = aws_instance.terra-instance[*].private_ip
}

output "instance_public_dns" {
  value = aws_instance.terra-instance[*].public_dns
}
