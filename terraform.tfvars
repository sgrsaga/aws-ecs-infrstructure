## Create IAM user
#username = "profbob"

###### VPC parameters
# 1. Create a VPC
vpc_name = "Project_VPC"
vpc_cidr = "10.0.0.0/16"
public_source_cidr = ["0.0.0.0/0"]
public_source_cidr_v6 = ["::/0"]
#azs = ["ap-south-1a","ap-south-1b","ap-south-1c"]

# 2. Create a Internet Gateway
ig_name = "Project_IG"

# 1.3. Create 2 Route tables
public_rt = "PUBLIC_RT"
private_rt = "PRIVATE_RT"

# 1.4. Create 3 Public Subnets
public_subnets = ["10.0.1.0/24","10.0.2.0/24","10.0.3.0/24","10.0.4.0/24","10.0.5.0/24","10.0.6.0/24"]
# 1.5. Create 3 Private Subnets
private_subnets = ["10.0.7.0/24","10.0.8.0/24","10.0.9.0/24","10.0.10.0/24","10.0.11.0/24","10.0.12.0/24"]

# 1.6. Create Public access Security Group
public_access_sg_ingress_rules = [
    {
      protocol = "tcp"
      from_port = 80
      to_port = 80
    },
    {
      protocol = "tcp"
      from_port = 443
      to_port = 443
    },
    {
      protocol = "tcp"
      from_port = 8080
      to_port = 8080
    },
    {
      protocol = "tcp"
      from_port = 22
      to_port = 22
    },
    {
      protocol = "-1"
      from_port = 0
      to_port = 0
    }
  ]

/*
  ### ------------- Database related Variables
db_identifier = "project-db"
db_backup_retention_period = 7
db_class = "db.t3.micro"
db_delete_protect = "false"
db_subnet_group_name = "postgres_sg"
db_engine = "postgres"
db_engine_version = "12.9"
db_name = "Project_db"
db_para_group_name = "default.postgres12"
#db_pass = "Test-NotHere"
db_storage = 100
db_storage_type = "gp2"
db_username = "Project"
is_storage_encrypted = "true"
max_allocated_storage_value = 500
muli_az_enable = "true"


############ Monitor and Alarm
delivery_email = "sgrsagara@gmail.com"
bill_threshold_amount = 3

############ ECS Cluster variables
alb_access_log_s3_bucket = "alb-access-logs-sgr-test-20221116"
## Autosacling EC2 parameters
ec2_image_id = "ami-03dbf0c122cb6cf1d"
ec2_instance_type = "t2.micro"
ssh_keyname = "EcsKey"
max_tasks = 6
min_tasks = 1
asg_avg_cpu_target = 1.75
ecs_task_avg_cpu_target = 0.25

############# Route 53 #####
domain_name_used = "devops-expert.online"

*/