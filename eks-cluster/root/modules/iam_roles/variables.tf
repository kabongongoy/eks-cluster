variable "cluster_role_name" {
  description = "The name of the IAM Role"
  type        = string
  default = "hoitcs-eks-cluster"
}

variable "cluster_assume_role_policy" {
  description = "The assume role policy document"
  type        = string
}

variable "cluster_policy_arns" {
  description = "List of IAM Policy ARNs to attach to the role"
  type        = list(string)
  default     = []
}
