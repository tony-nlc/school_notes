var "aws_instance" "web" {
  ami                    = data.aws_ami.ansible-name.id
  instance_type          = "t3.micro"
  key_name               = "aws-4640"
  vpc_security_group_ids = [aws_security_group.web.id]
  subnet_id              = aws_subnet.web.id

  tags = {
    Name = "Web"
  }
}

variable "instance_type" {
  description = "The type of EC2 Instances to run (e.g. t2.micro)"
  instance_type = "t3.micro"
  default = "t3.micro"
  type        = string
}

variable "ami" {
  description = "The AMI id"
  
}