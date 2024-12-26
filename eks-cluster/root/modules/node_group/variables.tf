
variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "node_group_name" {
  description = "Name of the EKS node group"
  type        = string
}

variable "node_role_arn" {
  description = "ARN of the IAM role for EKS nodes"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for the node group"
  type        = list(string)
}

variable "spot_instance_types" {
  description = "List of EC2 instance types to use for Spot Instances"
  type        = list(string)
  default     = ["t3.large", "t3.medium", "t2.large"]
}

variable "desired_size" {
  description = "Desired size of the node group"
  type        = number
  default     = 2
}

variable "min_size" {
  description = "Minimum size of the node group"
  type        = number
  default     = 1
}

variable "max_size" {
  description = "Maximum size of the node group"
  type        = number
  default     = 3
}

variable "labels" {
  description = "Key-value pair labels applied to the nodes"
  type        = map(string)
  default     = {}
}

variable "taints" {
  description = "Taints to apply to nodes in the node group"
  type        = list(object({
    key    = string
    value  = string
    effect = string
  }))
  default = []
}

variable "tags" {
  description = "Tags to apply to the node group"
  type        = map(string)
  default     = {}
}
