# Placeholder for variables.tf in aws_lbc
variable "role_name" {
  description = "IAM Role name for AWS Load Balancer Controller"
  type        = string
}

variable "assume_role_policy" {
  description = "Assume role policy document for AWS Load Balancer Controller"
  type        = string
}

variable "policy_name" {
  description = "Name of the IAM policy for AWS Load Balancer Controller"
  type        = string
}

variable "policy_document" {
  description = "Policy document for AWS Load Balancer Controller"
  type        = string
}

variable "cluster_name" {
  description = "EKS Cluster name"
  type        = string
}

variable "chart_version" {
  description = "Helm chart version for AWS Load Balancer Controller"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID for AWS Load Balancer Controller"
  type        = string
}
