terraform {
  required_version = "~> 1.8.5"

  backend "s3" {
    bucket         = "hoitcs-tf-state"
    key            = "tf-users/terraform.tfstate"
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
