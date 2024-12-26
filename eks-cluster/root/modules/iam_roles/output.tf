# output "eks_cluster_name" {
#   description = "The name of the EKS cluster"
#   value       = module.eks_cluster.eks_cluster_name
# }

# output "eks_cluster_arn" {
#   description = "The ARN of the EKS cluster"
#   value       = module.eks_cluster.eks_cluster_arn
# }

output "eks-cluster_iam_role_arn" {
  description = "The ARN of the IAM Role for the EKS cluster"
  value       = aws_iam_role.eks-cluster-role.arn
}
