output "Demo_0_Public_IP" {
  description = "get the value of demo 0 IP address"
  value       = aws_instance.Demo[0].public_ip
}

output "Demo_1_Public_IP" {
  description = "get the value of demo 1 IP address"
  value       = aws_instance.Demo[1].public_ip
}

output "Demo_2_Public_IP" {
  description = "get the value of demo 2 IP address"
  value       = aws_instance.Demo[2].public_ip
}
