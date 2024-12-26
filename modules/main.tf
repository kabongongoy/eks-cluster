# module "vpc" {
#   source = "../modules/vpc"

#   vpc_cidr               = "10.0.0.0/16"
#   instance_tenancy       = "default"
#   vpc_tags               = { Name = "hoitcsVPC", Project = "hoitcs TF Demo" }
#   igw_tags               = { Name = "hoitcsIGW", Project = "hoitcs TF Demo" }
#   eip_tags               = { Name = "hoitcsNatGatewayEIP1", Project = "hoitcs TF Demo" }
#   nat_gateway_tags       = { Name = "hoitcsNatGateway1", Project = "hoitcs TF Demo" }
#   public_subnet_cidrs    = ["10.0.1.0/24", "10.0.2.0/24"]
#   private_subnet_cidrs   = ["10.0.3.0/24", "10.0.4.0/24"]
#   availability_zones     = ["us-east-1a", "us-east-1b"]
#   public_subnet_1_tags   = { Name = "hoitcsPublicSubnet1", Project = "hoitcs TF Demo" }
#   public_subnet_2_tags   = { Name = "hoitcsPublicSubnet2", Project = "hoitcs TF Demo" }
#   private_subnet_1_tags  = { Name = "hoitcsPrivateSubnet1", Project = "hoitcs TF Demo" }
#   private_subnet_2_tags  = { Name = "hoitcsPrivateSubnet2", Project = "hoitcs TF Demo" }
#   public_rt_tags         = { Name = "hoitcsPublicRT", Project = "hoitcs TF Demo" }
#   private_rt_tags        = { Name = "hoitcsPrivateRT1", Project = "hoitcs TF Demo" }
# }
