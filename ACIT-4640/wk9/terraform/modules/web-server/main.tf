resource "aws_instance" "web" {
  ami                    = var.id
  instance_type          = var.ami
  key_name               = var.key_name
  vpc_security_group_ids = var.vpc_security_group_ids
  subnet_id              = var.subnet_id

  tags = {
    Name = "Web"
  }
}