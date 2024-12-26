terraform {
  required_version = "~> 1.8.5"

  backend "s3" {
    bucket         = "hoitcs-tf-state"
    key            = "tf-eks-cluster/terraform.tfstate"
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

module "iam_role_eks" {
  source = "./modules/iam_roles"

  cluster_role_name           = "${local.eks_name}-role"
  cluster_assume_role_policy  = data.aws_iam_policy_document.eks_assume_role_policy.json
  cluster_policy_arns = [
    "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  ]
}

module "eks_cluster" {
  source = "./modules/eks_cluster"

  cluster_name              = "${local.eks_name}-cluster"
  cluster_version           = local.eks_version
  cluster_role_arn          = module.iam_role_eks.eks-cluster_iam_role_arn
  subnet_ids                =  data.terraform_remote_state.networking.outputs.private_subnet_ids
  #subnet_ids               = [data.terraform_remote_state.networking.outputs.private_subnet_ids]

  endpoint_private_access   = false
  endpoint_public_access    = true
  authentication_mode       = "API"
  bootstrap_admin_permissions = true
  depends_on                = [module.iam_role_eks]
}


module "iam_node_group_roles" {
  source = "./modules/iam_node_roles"
  role_name          = "${local.node_group_name}-role"
  assume_role_policy  = data.aws_iam_policy_document.node-group_assume_role.json
  
}

module "eks_node_group_spot" {
  source            = "./modules/node_group"
  cluster_name      = local.eks_cluster_name
  node_group_name   = local.spot_node_group_name
  node_role_arn     = local.node_role_arn
  subnet_ids        = local.subnet_ids
  spot_instance_types = local.spot_instance_types
  desired_size      = local.scaling_config.desired_size
  min_size          = local.scaling_config.min_size
  max_size          = local.scaling_config.max_size
  labels            = local.labels
  tags              = local.tags
  depends_on = [ module.eks_cluster ]
}




























# module "eks_addons" {
#   source       = "./modules/eks_addons"
#   cluster_name = module.eks_cluster.eks_name
#   region       = var.region
# }

# module "helm_releases" {
#   source       = "./modules/helm_releases"
#   cluster_name = module.eks_cluster.eks_name
#   region       = var.region
#   vpc_id       = var.vpc_id
# }

# output "eks_cluster_name" {
#   value = module.eks_cluster.eks_name
# }

