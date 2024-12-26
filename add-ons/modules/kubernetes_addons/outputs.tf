output "addons" {
  value = aws_eks_addon.addons
}

output "roles" {
  value = aws_iam_role.roles
}

output "policies" {
  value = aws_iam_policy.policies
}

output "helm_releases" {
  value = helm_release.charts
}
