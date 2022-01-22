variable "zone_hostname" {
    type = string
    description = "Hostname used to identify the Route 53 Zone ID"
}

variable "record_name" {
    type = string
    description = "Name of the record to be added"
}

variable "alb_dns_name" {
    type = string
    description = "DNS name of the Load Balancer"
}

variable "alb_zone_id" {
    type = string
    description = "Zone ID of the Load Balancer"
}