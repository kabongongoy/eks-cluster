resource "aws_iam_user" "custom_admin" {
  name = "customad"
}

resource "aws_iam_policy" "custom_admin_eks" {
  name = "AmazonEKScustomadminrPolicy"

  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "eks:*"
            ],
            "Resource": "*"
        }
    ]
}
POLICY
}

resource "aws_iam_user_policy_attachment" "custom_admin_eks" {
  user       = aws_iam_user.custom_admin.name
  policy_arn = aws_iam_policy.custom_admin_eks.arn
}

resource "aws_eks_access_entry" "custom_admin" {
  cluster_name      = aws_eks_cluster.eks.name
  principal_arn     = aws_iam_user.custom_admin.arn
  kubernetes_groups = ["custom-admin"]
}
