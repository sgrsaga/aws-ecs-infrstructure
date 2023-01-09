## DNS Name- There should be a Hosted zone available for the DNS
variable "domain_name_used" {
    type = string  
}

# Target Grou ARN
variable "target_group_arn" {
    type = string  
}

## ALB ARN
variable "ecs_alb_arn" {
    type = string  
}

## AWS ALB DNS
variable "alb_dns_name" {
    type = string  
}

## AWS ALB ZONE ID
variable "alb_zone_id" {
    type = string  
}