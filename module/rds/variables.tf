#### VPC Variables ####
variable "vpc_id" {
    type = string  
}
######################### RDS variables #################
## DB Identifier
variable "db_identifier" {
    type = string
    default = "postgres-db"
}
## Allocated storage
variable "db_storage" {
    type = number
    default = 50
}
## MaX allocated
variable "max_allocated_storage_value" {
    type = number
    default = 500  
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
    default = "project_db"
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
## AWS SecretManager DB Password name prefix
variable "cm_db_pass_prefix" {
    type = string
    default = "postgres-db-password"
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
## DB deletion protection
variable "db_delete_protect" {
    type = string
    default = "false"
}
## Database subnet group name
variable "db_subnet_group_name" {
    type = string
    default = "default_sg"
}
## DB Security Grpup IDs
variable "vpc_sg_ids" {
    type = list(string)
    default = [ "sg-123" ]
}
## Monitoring Role ARN
variable "monitoring_role" {
    type = string
    default = "rds-monitoring-role"
}
