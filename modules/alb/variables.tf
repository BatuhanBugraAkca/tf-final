variable "alb_name" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "security_group_id" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "instance_ids" {
  type = list(string)
}

variable "domain_name" {
  type = string
}

variable "zone_id" {
  type = string
}

variable "alb_idle_timeout" {
  type        = number
  description = "Idle timeout in seconds"
  default     = 60
}