
locals {
  vpc_cidr             = "10.0.0.0/16"
  instance_tenancy     = "default"
  vpc_tags             = { Name = "hoitcsVPC" }
  igw_tags             = { Name = "hoitcsIGW" }
  eip_tags             = { Name = "hoitcsNatGatewayEIP1" }
  nat_gateway_tags     = { Name = "hoitcsNatGateway1" }
  public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]
  availability_zones   = ["us-east-1a", "us-east-1b"]
  public_subnet_1_tags = { Name = "hoitcsPublicSubnet1", "kubernetes.io/role/elb" = "1", "kubernetes.io/cluster/hoitcs-eks-cluster" = "owned" }
  public_subnet_2_tags = { Name = "hoitcsPublicSubnet2",  "kubernetes.io/role/elb" = "1", "kubernetes.io/cluster/hoitcs-eks-cluster" = "owned" }
  private_subnet_1_tags = { Name = "hoitcsPrivateSubnet1", "kubernetes.io/role/internal-elb" = "1", "kubernetes.io/cluster/hoitcs-eks-cluster" = "owned" }
  private_subnet_2_tags = { Name = "hoitcsPrivateSubnet2", "kubernetes.io/role/internal-elb" = "1", "kubernetes.io/cluster/hoitcs-eks-cluster" = "owned" }
  public_rt_tags        = { Name = "hoitcsPublicRT" }
  private_rt_tags       = { Name = "hoitcsPrivateRT"}
  enable_dns_hostnames = "true"
  enable_dns_support = "true"
  map_public_ip_on_launch = "true"
}
