variable "project_name" {
  description = "A prefix used for naming resources to ensure uniqueness and organization (e.g., 'acme-web-prod')."
  type        = string
}

variable "ami" {
  description = "The Amazon Machine Image (AMI) ID to use for the instance. Must be compatible with the chosen instance type and region."
  type        = string
}

variable "instance_type" {
  description = "The hardware configuration of the EC2 instance. Ensure the chosen type is supported by the selected AMI."
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  description = "The name of the pre-existing SSH Key Pair to allow secure access to the instance."
  type        = string
}

variable "vpc_security_group_ids" {
  description = "A list of Security Group IDs to associate with the instance for firewall and network traffic control."
  type        = list(string)
}

variable "subnet_id" {
  description = "The VPC Subnet ID where the instance will be deployed (e.g., subnet-0123456789abcdef)."
  type        = string
}