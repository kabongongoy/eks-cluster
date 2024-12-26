
output "spot_node_group_name" {
  description = "The name of the created Spot node group"
  value       = aws_eks_node_group.spot.node_group_name
}
