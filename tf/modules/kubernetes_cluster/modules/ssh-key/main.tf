resource "tls_private_key" "ssh" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

output "public_ssh_key" {
  # Only output a generated ssh public key
  value = var.public_ssh_key != "" ? "" : tls_private_key.ssh.public_key_openssh
}

variable "public_ssh_key" {
  description = "An ssh key set in the main variables of the aks module"
  default     = ""
}
