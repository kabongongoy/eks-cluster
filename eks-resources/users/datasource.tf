

data "terraform_remote_state" "eks_cluster" {
  backend = "s3"
  config = {
    bucket = "hoitcs-tf-state"
    key    = "tf-eks-cluster/terraform.tfstate"
    region = "us-east-1"
  } 
}

output "name" {
  value = data.terraform_remote_state.eks_cluster.outputs.eks_cluster_name
  
}

data "aws_caller_identity" "current" {}
