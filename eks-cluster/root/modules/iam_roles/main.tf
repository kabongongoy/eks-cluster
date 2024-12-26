# resource "aws_iam_role" "nodes" {
#   name = "${var.env}-${var.eks_name}-eks-nodes"

#   assume_role_policy = jsonencode({
#     Version = "2012-10-17",
#     Statement = [{
#       Effect    = "Allow",
#       Action    = "sts:AssumeRole",
#       Principal = { Service = "ec2.amazonaws.com" }
#     }]
#   })
# }

# resource "aws_iam_role_policy_attachment" "amazon_eks_worker_node_policy" {
#   policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
#   role       = aws_iam_role.nodes.name
# }

# resource "aws_iam_role_policy_attachment" "amazon_eks_cni_policy" {
#   policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
#   role       = aws_iam_role.nodes.name
# }

# output "node_role_arn" {
#   value = aws_iam_role.nodes.arn
# }

resource "aws_iam_role" "eks-cluster-role" {
  name               = var.cluster_role_name
  assume_role_policy = var.cluster_assume_role_policy
}

resource "aws_iam_role_policy_attachment" "eks-cluster-role-attachment" {
  for_each   = toset(var.cluster_policy_arns)
  role       = aws_iam_role.eks-cluster-role.name
  policy_arn = each.value
}






# resource "aws_iam_role" "eks-Node-role" {
#   name               = var.eks-node-role
#   assume_role_policy = var.eks-node_assume_role_policy
# }

# resource "aws_iam_role_policy_attachment" "eks-node-role-attachment" {
#   for_each   = toset(var.eks-node_policy_arns)
#   role       = aws_iam_role.eks-cluster-role.name
#   policy_arn = each.value
# }


# variable "eks-node_assume_role_policy" {}
# variable "eks-Node-role" {}
# variable "eks-node_policy_arns" {}
