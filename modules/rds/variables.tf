variable "db_identifier" {}
variable "allocated_storage" {}
variable "engine" {}
variable "instance_class" {}
variable "db_name" {}
variable "db_username" {}
variable "db_password" {}
variable "db_security_group_id" {}
variable "db_subnet_group" {}
variable "subnet_ids" {
  description = "Subnets to use for RDS subnet group"
  type        = list(string)
}