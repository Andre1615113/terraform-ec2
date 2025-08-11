variable "aws_region" {
  type    = string
  default = "us-east-1"
}

# AMI RHEL 9 oficial na região us-east-1
variable "rhel9_ami_id" {
  type    = string
  default = "ami-0f1d9d6e78c9ae3f7"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "key_name" {
  type    = string
  default = "minha-chave-ssh"
}

variable "security_group_id" {
  type    = string
  default = "sg-xxxxxxxx"
}

variable "instance_name" {
  type    = string
  default = "Andre-Bermudes-EC2"
}

variable "ssh_private_key_path" {
  type    = string
  default = "~/.ssh/minha-chave.pem"
}
