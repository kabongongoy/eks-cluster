# Placeholder for variables.tf in cluster_autoscaler
variable "role_name" {
  description = "IAM Role name for Cluster Autoscaler"
  type        = string
}

variable "assume_role_policy" {
  description = "Assume role policy document for Cluster Autoscaler"
  type        = string
}

variable "policy_name" {
  description = "Name of the IAM policy for Cluster Autoscaler"
  type        = string
}

variable "policy_document" {
  description = "Policy document for Cluster Autoscaler"
  type        = string
}

variable "cluster_name" {
  description = "EKS Cluster name"
  type        = string
}

variable "chart_version" {
  description = "Helm chart version for Cluster Autoscaler"
  type        = string
}

variable "region" {
  description = "AWS region"
  type        = string
}
