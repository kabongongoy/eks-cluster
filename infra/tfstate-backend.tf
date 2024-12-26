terraform {
  required_version = "~> 1.8.5"

  backend "s3" {
    bucket         = "hoitcs-tf-state"
    key            = "tf-infra/terraform.tfstate"
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
}


locals {
  bucket_name = "hoitcs-tf-state"
  table_name  = "hoitcs-tf"
}


module "tf-state" {
  source      = "../modules/tf-state"
  bucket_name = local.bucket_name
  table_name  = local.table_name
}


# module "name" {
#   source = "../modules/tf-state"
# }

output "bucket-name" {
  value = module.tf-state.name
  
}
