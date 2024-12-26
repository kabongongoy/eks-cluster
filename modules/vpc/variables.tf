# variable "vpc_cidr" {
#   description = "CIDR for VPC"
#   type        = string
# }

# variable "vpc_tags" {
#   description = "Tags for VPC"
#   type        = map(any)
# }

# variable "availability_zones" {
#   description = "AZs for Subnets"
#   type        = list(string)
# }

# variable "public_subnet_cidrs" {
#   description = "CIDRs for Public Subnets"
#   type        = list(string)
# }

# variable "private_subnet_cidrs" {
#   description = "CIDRs for Private Subnets"
#   type        = list(string)
# }






variable "instance_tenancy" {
  description = "The tenancy option for instances launched into the VPC. Valid values are 'default', 'dedicated', or 'host'."
  type        = string
  default     = "default"
}

variable "igw_tags" {
  description = "Tags to assign to the Internet Gateway."
  type        = map(string)
}

variable "eip_tags" {
  description = "Tags to assign to the Elastic IP address used for the NAT Gateway."
  type        = map(string)
}

variable "nat_gateway_tags" {
  description = "Tags to assign to the NAT Gateway."
  type        = map(string)
}

variable "public_subnet_1_tags" {
  description = "Tags to assign to the first public subnet."
  type        = map(string)
}

variable "public_subnet_2_tags" {
  description = "Tags to assign to the second public subnet."
  type        = map(string)
}

variable "private_subnet_1_tags" {
  description = "Tags to assign to the first private subnet."
  type        = map(string)
}

variable "private_subnet_2_tags" {
  description = "Tags to assign to the second private subnet."
  type        = map(string)
}

variable "public_rt_tags" {
  description = "Tags to assign to the public route table."
  type        = map(string)
}

variable "private_rt_tags" {
  description = "Tags to assign to the private route table."
  type        = map(string)
}


variable "vpc_cidr" {
  description = "The CIDR block for the VPC."
  type        = string
}

variable "vpc_tags" {
  description = "Tags to assign to the VPC."
  type        = map(string)
}

variable "public_subnet_cidrs" {
  description = "List of CIDR blocks for public subnets."
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "List of CIDR blocks for private subnets."
  type        = list(string)
}

variable "availability_zones" {
  description = "List of availability zones to use for subnets."
  type        = list(string)
}

variable "project_name" {
  description = "Name of the project to use in tags for resources."
  type        = string
  default     = "hoitcs TF Demo"
}

variable "enable_dns_support" {
  description = "A boolean flag to enable/disable DNS support in the VPC."
  type        = bool
  default     = true
}

variable "enable_dns_hostnames" {
  description = "A boolean flag to enable/disable DNS hostnames in the VPC."
  type        = bool
  default     = true
  
}
variable "map_public_ip_on_launch" {
  description = "Specify true to indicate that instances launched into the subnet should be assigned a public IP address."
  type        = bool
  default     = true
  
}
