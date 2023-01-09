#### VPC Variables ####
variable "vpc_id" {
    type = string  
}

## Autosacling EC2 parameters
# EC2 image id
variable "ec2_image_id" {
    type = string  
}
# EC2 instance type
variable "ec2_instance_type" {
    type = string  
}
## Created Keyname
variable "ssh_keyname" {
    type = string  
}

## MAX Running task count
variable "max_tasks" {
    type = number  
}

## MIN Running task count
variable "min_tasks" {
    type = number  
}

## EC2 AutoScaling AVG CPU threshold 
variable "asg_avg_cpu_target" {
    type = number  
}

## ECS Task AutoScaling AVG CPU threshold 
variable "ecs_task_avg_cpu_target" {
    type = number  
}

### ALB Access logs saving bucket name
variable "alb_access_log_s3_bucket" {
    type = string
}