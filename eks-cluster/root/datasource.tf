

data "terraform_remote_state" "networking" {
  backend = "s3"
  config = {
    bucket = "hoitcs-tf-state"
    key    = "tf-networking/terraform.tfstate"
    region = "us-east-1"
  } 
}

data "aws_iam_policy_document" "eks_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["eks.amazonaws.com"]
    }
  }
  
}

data "aws_iam_policy_document" "node-group_assume_role" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
  
}


# data "aws_iam_policy_document" eks-node_assume_role{
#   statement {
#     actions = ["sts:AssumeRole"]
#     principals {
#       type        = "Service"
#       identifiers = ["eks.amazonaws.com"]
#     }
#   }
# }
