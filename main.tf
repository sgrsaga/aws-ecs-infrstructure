## Add the provide section.
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.38.0"  ## was 3.65.0
    }
  }
}

## Setting the AWS S3 as the Terraform backend
terraform {
  backend "s3" {
    bucket = "sagara-test-b1/Test-Repo/"
    key    = "terraform.tfstate"
    region = "ap-south-1"
  }
}

/*
## Terraform Backend
terraform {
  backend "remote" {
    organization = "home_org_sagara"
    hostname = "app.terraform.io"
    workspaces {
      name = "Test-Repo"
    }
  }
}
*/


provider "aws" {
  region = "us-east-1"
  default_tags {
   tags = {
     Environment = "PROJECT-001"
     Owner = "MyProject"
     Goal = "TestECS"
   }
 }
}


# ## 1. Call IAM user create module to create user profile for profbob
# module "iam" {
#   source = "./module/iam"
#   username = var.username  
# }

## 2. Call the Network module to generate VPC components
module "main_network" {
  source = "./module/network"
  vpc_name = var.vpc_name
  vpc_cidr = var.vpc_cidr
  public_source_cidr = var.public_source_cidr
  public_source_cidr_v6 = var.public_source_cidr_v6
  ig_name = var.ig_name

  public_subnets = var.public_subnets
  private_subnets = var.private_subnets
  public_access_sg_ingress_rules = var.public_access_sg_ingress_rules
  public_rt = var.public_rt
  private_rt = var.private_rt
}

# ## 3. Call Databse creation module
# module "pg_database" {
#   source = "./module/rds"
#   db_identifier = var.db_identifier
#   vpc_id = module.main_network.vpc_id
#   db_name = var.db_name
#   db_subnet_group_name = var.db_subnet_group_name
#   depends_on = [module.main_network] 
# }

/*
## 4. Call ECS creation module
module "ecs_cluster" {
  source = "./module/ecs"
  vpc_id = module.main_network.vpc_id
  ## ALB Access logs S3 bucket
  alb_access_log_s3_bucket = var.alb_access_log_s3_bucket
  ## Autoscaling EC2 parameters
  ec2_image_id = var.ec2_image_id
  ec2_instance_type = var.ec2_instance_type
  ssh_keyname = var.ssh_keyname

  ## MIN and MAX value are used to define minimim and maximum EC2 and Task counts
  max_tasks = var.max_tasks
  min_tasks = var.min_tasks
  ## EC2 autoscaling triggering CPU target value
  asg_avg_cpu_target = var.asg_avg_cpu_target
  ## ECS Service task scaling CPU target value
  ecs_task_avg_cpu_target = var.ecs_task_avg_cpu_target
  depends_on = [module.main_network] 
}


## 4. Route 53 Configuration
module "route53" {
  source = "./module/r53"
  domain_name_used = var.domain_name_used
  target_group_arn = module.ecs_cluster.lb_target_group
  ecs_alb_arn = module.ecs_cluster.ecs_alb
  alb_dns_name = module.ecs_cluster.ecs_alb_dns
  alb_zone_id = module.ecs_cluster.ecs_alb_zone_id 
  depends_on = [
    module.ecs_cluster
  ]
}

## 5. Create monitoring
module "monitor_and_alarm" {
  source = "./module/monitor"
  delivery_email = var.delivery_email
  bill_threshold_amount = var.bill_threshold_amount
  depends_on = [
    module.main_network,
    module.ecs_cluster,
    module.route53
  ]
  
}
*/