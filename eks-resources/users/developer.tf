# resource "aws_iam_user" "developer" {
#   name = "developer" 
  
# }
# resource "aws_iam_policy" "developer_eks" {
#   name = "AmazonEKSClusterViewerPolicy"

#   policy = <<EOF
# {
#     "Version": "2012-10-17",
#     "Statement": [
#         {
#             "Effect": "Allow",
#             "Action": [
#                 "eks:DescribeCluster",
#                 "eks:ListClusters"
#             ],
#             "Resource": "*"
#         }
#     ]
# }
# EOF
# }

# resource "aws_iam_user_policy_attachment" "developer_eks" {
#   user = aws_iam_user.developer.name
#   policy_arn = aws_iam_policy.developer_eks.arn
# }

# resource "aws_eks_access_entry" "developer" {
#   cluster_name = data.terraform_remote_state.eks_cluster.outputs.eks_cluster_name
#   principal_arn = aws_iam_user.developer.arn
#   kubernetes_groups = ["my-viewer"] 
# }
