variable "vpc_id" {
  description = "VPC ID to attach Internet Gateway and NAT Gateway"
  type        = string
}

variable "public_subnets" {
  description = "List of public subnet IDs"
  type        = list(string)
}

variable "private_subnets" {
  description = "List of private subnet IDs"
  type        = list(string)
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
}

variable "subnet_id" {
  description = "The subnet ID for the NAT Gateway"
  type        = string
}
