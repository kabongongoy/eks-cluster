# Placeholder for variables.tf in iam_node_group
variable "role_name" {
  description = "Name of the IAM role for EKS nodes"
  type        = string
}

variable "assume_role_policy" {
  description = "Assume role policy document for EKS nodes"
  type        = string
}
