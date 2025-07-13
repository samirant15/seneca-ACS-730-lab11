resource "aws_security_group" "web-sg" {
  name = "${random_pet.sg.id}-sg"

  # Ingress: Restrict to specific trusted IPs (e.g., your office/home IP)
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["203.0.113.0/32"]
  }

  # Egress: Still allows outbound to install packages, but can also be tightened if needed
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
