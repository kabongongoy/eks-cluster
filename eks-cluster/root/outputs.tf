output "eks_cluster_name" {
  description = "The name of the EKS cluster"
  value       = module.eks_cluster.eks_cluster_name
}

output "eks_cluster_arn" {
  description = "The ARN of the EKS cluster"
  value       = module.eks_cluster.eks_cluster_arn
}

output "eks_iam_role_arn" {
  description = "The ARN of the IAM Role for the EKS cluster"
  value       = module.iam_role_eks.eks-cluster_iam_role_arn

}
output "subnets" {
  value = data.terraform_remote_state.networking.outputs.private_subnet_ids
}

output "eks_node_group_role_arn" {
  description = "The ARN of the IAM Role for the EKS cluster"
  value       = module.iam_node_group_roles.node-group_role_arn
}
