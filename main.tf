provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "andre_ec2" {
  ami                    = var.rhel9_ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [var.security_group_id]

  tags = {
    Name = var.instance_name
  }
}

# Provisioner para instalação via SSH
resource "null_resource" "setup_nginx" {
  triggers = {
    instance_id = aws_instance.andre_ec2.id
  }

  connection {
    type        = "ssh"
    host        = aws_instance.andre_ec2.public_ip
    user        = "ec2-user"
    private_key = file(var.ssh_private_key_path)
  }

  provisioner "remote-exec" {
    inline = [
      # --- NGINX Nativo (porta 80) ---
      # "sudo dnf -y install nginx",
      # "echo '<html><body><h1>Servidor Nginx OK - Deploy Terraform</h1></body></html>' | sudo tee /usr/share/nginx/html/index.html",
      # "sudo systemctl enable --now nginx",
      # "if systemctl is-active --quiet firewalld; then sudo firewall-cmd --add-service=http --permanent && sudo firewall-cmd --reload; fi",

      # --- NGINX com Podman (porta 8080) ---
      # "sudo dnf -y install podman",
      # "sudo podman run -d --name nginx8080 -p 8080:80 docker.io/nginx",
      # "container_id=$(sudo podman ps -q --filter name=nginx8080)",
      # "sudo podman exec $container_id sh -c \"echo '<html><body><h1>Servidor Nginx OK (Container) - Deploy Terraform</h1></body></html>' > /usr/share/nginx/html/index.html\"",
      # "if systemctl is-active --quiet firewalld; then sudo firewall-cmd --add-port=8080/tcp --permanent && sudo firewall-cmd --reload; fi"
    ]
  }
}
