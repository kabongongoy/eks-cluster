
locals {
  eks_cluster_name    = "${local.eks_name}-cluster"
  env         = "dev"               # Example environment name
  eks_name    = "hoitcs-eks"    # Example EKS cluster name
  eks_version = "1.30" 
  node_group_name = "hoitcs_node-group"            # Example EKS version
  spot_node_group_name = "spot-instances-group"
  node_role_arn       = module.iam_node_group_roles.node-group_role_arn
  subnet_ids          = data.terraform_remote_state.networking.outputs.private_subnet_ids
  spot_instance_types = ["t3.large", "t3.medium", "m5.large"]
  scaling_config = {
    desired_size = 1
    min_size     = 1
    max_size     = 3
  }
  labels = {
    role = "spot"
  }
  tags = {
    Environment = "lab"
    Type        = "Spot"
  }
}



