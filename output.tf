output "private_key" {
  value     = tls_private_key.pvt-key.private_key_pem
  sensitive = true
}

output "instance-id" {
  value = aws_instance.ec2[*].id
}

output "public_ip" {
  value = aws_instance.ec2[*].public_ip
}

output "user_data_path" {
  value = local.user_data_script_path
}