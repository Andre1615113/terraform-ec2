# outputs.tf

# Host preferencial: DNS público se existir, senão IP público
locals {
  aluno_host = coalesce(aws_instance.aluno_ec2.public_dns, aws_instance.aluno_ec2.public_ip)
}

output "aluno_public_dns" {
  description = "DNS público da instância (vazio se a VPC não tiver DNS hostnames habilitado)"
  value       = aws_instance.aluno_ec2.public_dns
}

output "aluno_public_ip" {
  description = "IP público da instância"
  value       = aws_instance.aluno_ec2.public_ip
}

output "aluno_host" {
  description = "Host para acesso (DNS público ou, se indisponível, IP público)"
  value       = local.aluno_host
}

# URLs de validação (opcionais)
output "nginx_nativo_url" {
  description = "URL do NGINX nativo na porta 80"
  value       = "http://${local.aluno_host}"
}

output "nginx_podman_url" {
  description = "URL do NGINX em container (porta 8080)"
  value       = "http://${local.aluno_host}:8080"
}