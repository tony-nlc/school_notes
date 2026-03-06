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


variable "project_name" {
    description = "Project Name"
    type = string
}

variable "ami" {
  description = "The AMI id"
  type = string
}

variable "instance_type" {
  description = "The type of EC2 Instances to run (e.g. t2.micro)"
  default = "t3.micro"
  type        = string
}

variable "key_name" {
    description = "Key Name"
    type = string
}

variable "vpc_security_group_ids" {
    description = "vpc_security_group_ids"
    type = list(string)
}