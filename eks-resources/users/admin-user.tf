
# resource "aws_iam_role" "eks_admin" {
#   name = "eks_admin"
#   assume_role_policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Effect = "Allow"
#         Principal = {
#           AWS = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
#         }
#         Action = "sts:AssumeRole"
#       }
#     ]
#   })
  
# }

# resource "aws_iam_policy" "eks_full_access_with_passrole" {
#   name        = "EKSFullAccessWithPassRole"
#   description = "Policy to allow full EKS actions and passing a role to EKS service"

#   policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Effect   = "Allow"
#         Action   = "eks:*"
#         Resource = "*"
#       },
#       {
#         Effect   = "Allow"
#         Action   = "iam:PassRole"
#         Resource = "*"
#         Condition = {
#           StringEquals = {
#             "iam:PassedToService" : "eks.amazonaws.com"
#           }
#         }
#       }
#     ]
#   })
# }

# resource "aws_iam_role_policy_attachment" "eks_admin" {
#   role       = aws_iam_role.eks_admin.name
#   policy_arn = aws_iam_policy.eks_full_access_with_passrole.arn
# }

# resource "aws_iam_user" "eks-admin" {
#   name = "eks-admin"
# }

# # resource "aws_iam_policy" "eks_assume_role" {
# #   name = "eks_assume_role"
# #   description = "Policy to allow assuming EKS roles"
# #   policy = jsonencode({
# #     Version = "2012-10-17"
# #     Statement = [
# #       {
# #         Effect = "Allow",
# #         Action = "sts:AssumeRole",
# #         Resource = "${aws_iam_role.eks_admin.arn}"
# #       }
# #     ]
# #   })
  
# # }
# resource "aws_iam_policy" "eks_assume_admin" {
#   name = "AmazonEKSAssumeAdminRolePolicy"
#   description = "Policy to allow assuming EKS roles"
#   policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Effect = "Allow",
#         Action = "sts:AssumeRole",
#         Resource = "${aws_iam_role.eks_admin.arn}"
#       }
#     ]
#   })
  
# }

# resource "aws_iam_user_policy_attachment" "admin-user" {
#   user       = aws_iam_user.eks-admin.name
#   policy_arn = aws_iam_policy.eks_assume_admin.arn
# }

# resource "aws_eks_access_entry" "admin-user" {
#   cluster_name = data.terraform_remote_state.eks_cluster.outputs.eks_cluster_name
#   principal_arn = aws_iam_role.eks_admin.arn
#   kubernetes_groups = ["my-admin"]
  
# }




resource "aws_iam_role" "eks_admin" {
  name = "eks-eks_admin"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          AWS = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
  
}



resource "aws_iam_policy" "eks_admin" {
  name        = "AmazonEKSAminPolicy"

  description = "Policy to allow full EKS actions and passing a role to EKS service"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = "eks:*"
        Resource = "*"
      },
      {
        Effect   = "Allow"
        Action   = "iam:PassRole"
        Resource = "*"
        Condition = {
          StringEquals = {
            "iam:PassedToService" : "eks.amazonaws.com"
          }
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "eks_admin" {
  role       = aws_iam_role.eks_admin.name
  policy_arn = aws_iam_policy.eks_admin.arn
}

resource "aws_iam_user" "manager" {
  name = "manager"
}

resource "aws_iam_policy" "eks_assume_admin" {
  name = "AmazonEKSAssumeAdminPolicy"
  description = "Policy to allow assuming EKS roles"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow",
        Action = "sts:AssumeRole",
        Resource = "${aws_iam_role.eks_admin.arn}"
      }
    ]
  })
  
}

resource "aws_iam_user_policy_attachment" "manager" {
  user       = aws_iam_user.manager.name
  policy_arn = aws_iam_policy.eks_assume_admin.arn
}
 
resource "aws_eks_access_entry" "manager" {
  cluster_name = data.terraform_remote_state.eks_cluster.outputs.eks_cluster_name
  principal_arn = aws_iam_user.manager.arn
  kubernetes_groups = ["my-admin"]
}

