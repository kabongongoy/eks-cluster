variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "addons" {
  description = "Map of EKS add-ons and their versions"
  type        = map(object({
    version = string
  }))
}

variable "roles" {
  description = "Map of IAM roles and their assume role policy actions"
  type        = map(object({
    assume_role_actions = list(string)
  }))
}

variable "policies" {
  description = "Map of IAM policies and their statements"
  type        = map(object({
    statements = list(object({
      Effect   = string
      Action   = list(string)
      Resource = list(string)
    }))
  }))
}

variable "role_policy_attachments" {
  description = "Map of role-policy attachments"
  type        = map(object({
    role   = string
    policy = string
  }))
}

variable "pod_identity_associations" {
  description = "Map of pod identity associations"
  type        = map(object({
    namespace       = string
    service_account = string
    role            = string
  }))
}

variable "helm_releases" {
  description = "Map of Helm releases and their configurations"
  type        = map(object({
    repository  = string
    chart       = string
    namespace   = string
    version     = string
    set_values  = list(object({
      name  = string
      value = string
    }))
    depends_on = list(string)
  }))
}
