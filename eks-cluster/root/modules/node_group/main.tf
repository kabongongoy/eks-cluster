
# resource "aws_eks_node_group" "spot" {
#   cluster_name    = var.cluster_name
#   node_group_name = var.node_group_name
#   node_role_arn   = var.node_role_arn

#   subnet_ids      = var.subnet_ids
#   instance_types  = var.spot_instance_types

#   scaling_config {
#     desired_size = var.desired_size
#     min_size     = var.min_size
#     max_size     = var.max_size
#   }

#   capacity_type = "SPOT" # Specifies Spot capacity

#   labels = var.labels

#   dynamic "taints" {
#     for_each = var.taints
#     content {
#       key    = taints.value.key
#       value  = taints.value.value
#       effect = taints.value.effect
#     }
#   }

#   tags = var.tags

#   depends_on = [
#     aws_iam_role_policy_attachment.amazon_eks_worker_node_policy,
#     aws_iam_role_policy_attachment.amazon_eks_cni_policy,
#     aws_iam_role_policy_attachment.amazon_ec2_container_registry_read_only,
#   ]
# }


resource "aws_eks_node_group" "spot" {
  cluster_name    = var.cluster_name
  node_group_name = var.node_group_name
  node_role_arn   = var.node_role_arn
  subnet_ids      = var.subnet_ids

  scaling_config {
    desired_size = var.desired_size
    min_size     = var.min_size
    max_size     = var.max_size
  }

  instance_types = var.spot_instance_types

  labels = var.labels
  tags   = var.tags
}
# resource "null_resource" "apply_taints" {
#   provisioner "local-exec" {
#     command = <<EOT
#     kubectl taint nodes -l role=spot spot-instance=true:NoSchedule
#     EOT
#   }
# }
