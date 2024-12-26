
terraform {
  required_version = "~> 1.8.5"

  backend "s3" {
    bucket         = "hoitcs-tf-state"
    key            = "tf-networking/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "hoitcs-tf"
    encrypt        = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  default_tags {
    tags = {
      "Terraform" = "true"
       "Project" = "hoitcs TF_EKS Demo"
    }
  }
}




module "vpc" {
  source = "../modules/vpc"

  vpc_cidr               = local.vpc_cidr
  instance_tenancy       = local.instance_tenancy
  vpc_tags               = local.vpc_tags
  igw_tags               = local.igw_tags
  eip_tags               = local.eip_tags
  nat_gateway_tags       = local.nat_gateway_tags
  public_subnet_cidrs    = local.public_subnet_cidrs
  private_subnet_cidrs   = local.private_subnet_cidrs
  availability_zones     = local.availability_zones
  public_subnet_1_tags   = local.public_subnet_1_tags
  public_subnet_2_tags   = local.public_subnet_2_tags
  private_subnet_1_tags  = local.private_subnet_1_tags
  private_subnet_2_tags  = local.private_subnet_2_tags
  public_rt_tags         = local.public_rt_tags
  private_rt_tags        = local.private_rt_tags
  enable_dns_hostnames   = local.enable_dns_hostnames
  enable_dns_support     = local.enable_dns_support
  map_public_ip_on_launch = local.map_public_ip_on_launch
}
