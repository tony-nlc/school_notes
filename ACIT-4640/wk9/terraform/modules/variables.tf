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

variable "subnet_id" {
    description = "Subnet ID"
    type = string
}