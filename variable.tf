
variable "aws_region" {
  description = "AWS region to deploy the EC2 instance"
  type        = string
  default     = "ap-south-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "my_ip_cidr" {
  description = "Your public IP in CIDR notation, for SSH access"
  type        = string
}
