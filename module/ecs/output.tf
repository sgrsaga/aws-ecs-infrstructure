output "public_subnet_ids" {
    value = data.aws_subnets.public_subnets.ids  
}


## Project Cluster name
output "ecs_cluster_name" {
    value = aws_ecs_cluster.project_cluster.name
}

## ECS Service name
output "ecs_service_name" {
    value = aws_ecs_service.service_node_app.name
}


## Target group will refered in R53 whe adding a new HTTPS listner
output "lb_target_group" {
  value = aws_lb_target_group.ecs_alb_tg.arn
}

## Output AWS ALB ARN
output "ecs_alb" {
  value = aws_lb.ecs_lb.arn
}

## Output AWS ALB DNS name
output "ecs_alb_dns" {
  value = aws_lb.ecs_lb.dns_name
}

# Output AWS ALB Hosted Zoneid for R53 A record usage as alias
output "ecs_alb_zone_id" {
  value = aws_lb.ecs_lb.zone_id
}