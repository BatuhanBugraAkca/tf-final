variable "instance_type" {
  description = "The type of instance to start"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs to launch instances in"
  type        = list(string)
}

variable "security_group_id" {
  description = "The security group ID to attach to the instances"
  type        = string
}

variable "key_name" {
  description = "The name of the key pair to use for the instances"
  type        = string
}