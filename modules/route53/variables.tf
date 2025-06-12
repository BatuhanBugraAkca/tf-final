variable "zone_id" {
  description = "The ID of the hosted zone in Route 53"
  type        = string
}

variable "domain_name" {
  description = "The domain name for the CNAME record"
  type        = string
}

variable "alb_dns_name" {
  description = "The DNS name of the ALB"
  type        = string
}
