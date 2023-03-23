### IAM user
/*
## username
variable "username" {
  type = string
}
*/
# 1.1. Create a VPC
variable "vpc_name" {
  type = string
  default = "TERA_VPC"
}
variable "vpc_cidr" {
  type = string
  default = "10.0.0.0/16"
}
variable "public_source_cidr" {
  type = list(string)
  default = ["10.0.0.0/16"]
}
variable "public_source_cidr_v6" {
  type = list(string)
  default = ["::/0"]
}


# 2. Create a Internet Gateway
variable "ig_name" {
  type = string
  default = "NEW_IG"
}

# 1.3. Create 2 Route tables
variable "public_rt" {
  type = string
  default = "Public_RT"
}
variable "private_rt" {
  type = string
  default = "Private_RT"
}

# 1.4. Create 3 Public Subnets
variable "public_sn_count" {
  type = number
  default = 1
}
variable "public_subnets" {
  type = list(string)
  default = ["10.0.1.0/24"]
}

# 1.5. Create 3 Private Subnets
variable "private_sn_count" {
  type = number
  default = 1
}
variable "private_subnets" {
  type = list(string)
  default = ["10.0.2.0/24"]
}

# 1.6. Create Public access Security Group
variable "public_access_sg_ingress_rules" {
  type = list(object({
    from_port = number
    to_port = number
    protocol = string
  }))
  default = [
  ]
}

/*
####### Database Creation related Variables
## DB Identifier
variable "db_identifier" {
    type = string
    default = "new-db"
}
## Alocated storage
variable "db_storage" {
    type = number
    default = 10 
}
## MaX alocate
variable "max_allocated_storage_value" {
    type = number
    default = 100  
}
## DB engine
variable "db_engine" {
    type = string
    default = "postgres"
}

## DB engine version
variable "db_engine_version" {
    type = string
    default = "12.9"
}

## Instance Class
variable "db_class" {
    type = string
    default = "db.t3.micro"
}

## DB name
variable "db_name" {
    type = string
    default = "mydb"
}

## DB username
variable "db_username" {
    type = string
    default = "myuser"
}
## DB Password
variable "db_pass" {
    type = string
    default = "myDbPass"
}
## DB Parameter group
variable "db_para_group_name" {
    type = string
    default = "default.postgres12"
}

## DB storeage type
variable "db_storage_type" {
    type = string
    default = "gp2"
}
## Backup retention period
variable "db_backup_retention_period" {
    type = number
    default = 7
}
## Multi AZ ?
variable "muli_az_enable" {
    type = string
    default = "true"
}
## storage_encrypted ?
variable "is_storage_encrypted" {
    type = string
    default = "true"
}
## Database subnet group name
variable "db_subnet_group_name" {
    type = string
    default = "default_sg"
}
## DB deletion protection
variable "db_delete_protect" {
    type = string
    default = "false"
}

############## Monitor and Alert ############
## Notification email address
variable "delivery_email" {
    type = string
}

## Billing threshold
variable "bill_threshold_amount" {
    type = number
}
*/

############## ECS SErvice configure
/*
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
*/
## ALB Access logs saving bucket name
variable "alb_access_log_s3_bucket" {
    type = string
}

## MAX Running EC2 and task count
variable "max_tasks" {
    type = number  
}

## MIN Running EC2 and task count
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


######### Route 53
## DNS Name- There should be a Hosted zone available for the DNS
variable "domain_name_used" {
    type = string  
}

