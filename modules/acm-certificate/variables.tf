variable "domain" {
    description = "Domain name to generate the ACM certificate for"
}

variable "zone_id" {
    description = "Zone ID of the Route 53 used for ACM certificate validation"
}