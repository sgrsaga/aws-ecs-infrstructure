## Request Certificate
resource "aws_acm_certificate" "ideamics_crt" {
  domain_name       = var.domain_name_used
  validation_method = "DNS"
}
## Validate FQDN
resource "aws_acm_certificate_validation" "ideamics_validation" {
  certificate_arn         = aws_acm_certificate.ideamics_crt.arn
  validation_record_fqdns = [for record in aws_route53_record.ideamics_record : record.fqdn]
}


## Get Route 53 zone details
data "aws_route53_zone" "ideamics_r53z" {
  name         = var.domain_name_used
  private_zone = false
}

## Create record in hosted zone for ALB in A type alias
resource "aws_route53_record" "ideamics_a_record" {
  zone_id = data.aws_route53_zone.ideamics_r53z.zone_id
  name    = var.domain_name_used
  type    = "A"
  alias {
    name = var.alb_dns_name
    zone_id = var.alb_zone_id
    evaluate_target_health = true
  }
}
## Create record in Hosted zone for all FQDNs
resource "aws_route53_record" "ideamics_record" {
  for_each = {
    for domin_valid in aws_acm_certificate.ideamics_crt.domain_validation_options : domin_valid.domain_name => {
      name   = domin_valid.resource_record_name
      record = domin_valid.resource_record_value
      type   = domin_valid.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = data.aws_route53_zone.ideamics_r53z.zone_id
}

# Create new listner to the target group with certificate link
resource "aws_lb_listener" "front_end" {
  load_balancer_arn = var.ecs_alb_arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = aws_acm_certificate_validation.ideamics_validation.certificate_arn

  default_action {
    type             = "forward"
    target_group_arn = var.target_group_arn
  }
}