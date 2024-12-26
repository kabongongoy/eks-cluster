# Placeholder for variables.tf in eks_cluster
variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "cluster_version" {
  description = "Version of the EKS cluster"
  type        = string
}

variable "cluster_role_arn" {
  description = "ARN of the IAM Role for the EKS cluster"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for the EKS cluster"
  type        = list(string)
}

variable "endpoint_private_access" {
  description = "Enable private access to the EKS cluster"
  type        = bool
  default     = false
}

variable "endpoint_public_access" {
  description = "Enable public access to the EKS cluster"
  type        = bool
  default     = true
}

variable "authentication_mode" {
  description = "Authentication mode for the EKS cluster"
  type        = string
  default     = "API"
}

variable "bootstrap_admin_permissions" {
  description = "Allow bootstrap admin permissions"
  type        = bool
  default     = true
}

# variable "depends_on" {
#   description = "Dependencies for the EKS cluster resource"
#   type        = list(any)
#   default     = []
# }
