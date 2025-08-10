variable "aws_region"        { type = string  default = "us-xxxxx" } # Regiao
variable "rhel_ami_id"       { type = string  default = "ami-xxxxxxx" } # RHEL 9 us-east-2
variable "instance_type"     { type = string  default = "t2.xxxx" } # Tamanho do Servidor
variable "key_name"          { type = string  default = "minha-chave-ssh" } # Nome da chave SSH
variable "security_group_id" { type = string  default = "sg-xxxxxxxx" } # SG Group
variable "instance_name"     { type = string  default = "" } # Nome do servidor, coloque o seu primeiro nome
