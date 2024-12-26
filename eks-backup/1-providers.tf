# Configure the AWS Provider

terraform {
  required_version = "~> 1.3"

  backend "s3" {
    bucket         = "hoitcs-tf-state"
    key            = "tf-eks/eks.tfstate"
    region         = "us-east-1"
    dynamodb_table = "hoitcs-tf"
    encrypt        = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.53"
	    
    }
  }
}

# terraform {
#   required_version = ">= 1.0"

#   required_providers {
#     aws = {
#       source  = "hashicorp/aws"
#       version = "~> 5.53"
#     }
#   }
# }
