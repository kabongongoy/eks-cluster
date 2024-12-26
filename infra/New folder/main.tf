# terraform {
#   required_version = "~> 1.8.5"

#   backend "s3" {
#     bucket         = "hoitcs-tf-state"
#     key            = "tf-infra/terraform.tfstate"
#     region         = "us-east-1"
#     dynamodb_table = "hoitcs-tf"
#     encrypt        = true
#     depends_on     = [aws_s3_bucket.terraform_state]
#   }
# }

# provider "aws" {
#   region = "us-east-1"
# }
