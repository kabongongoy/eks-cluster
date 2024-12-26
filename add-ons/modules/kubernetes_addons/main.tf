
resource "aws_eks_addon" "addons" {
  for_each = var.addons

  cluster_name  = var.cluster_name
  addon_name    = each.key
  addon_version = each.value.version
}

resource "aws_iam_role" "roles" {
  for_each = var.roles

  name = "${var.cluster_name}-${each.key}"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = each.value.assume_role_actions
        Principal = {
          Service = "pods.eks.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_policy" "policies" {
  for_each = var.policies

  name = "${var.cluster_name}-${each.key}"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = each.value.statements
  })
}

resource "aws_iam_role_policy_attachment" "attachments" {
  for_each = var.role_policy_attachments

  policy_arn = aws_iam_policy.policies[each.value.policy].arn
  role       = aws_iam_role.roles[each.value.role].name
}

resource "aws_eks_pod_identity_association" "pod_identities" {
  for_each = var.pod_identity_associations

  cluster_name    = var.cluster_name
  namespace       = each.value.namespace
  service_account = each.value.service_account
  role_arn        = aws_iam_role.roles[each.value.role].arn
}

resource "helm_release" "charts" {
  for_each = var.helm_releases

  name       = each.key
  repository = each.value.repository
  chart      = each.value.chart
  namespace  = each.value.namespace
  version    = each.value.version

  dynamic "set" {
    for_each = each.value.set_values
    content {
      name  = set.value.name
      value = set.value.value
    }
  }

  depends_on = each.value.depends_on
}
