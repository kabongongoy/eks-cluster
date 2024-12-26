# # Create a VPC
# resource "aws_vpc" "hoitcsVPC" {
#   instance_tenancy = "default"
#   cidr_block       = var.vpc_cidr
#   tags             = var.vpc_tags
# }

# resource "aws_internet_gateway" "hoitcsIGW" {
#   vpc_id = aws_vpc.hoitcsVPC.id
#   tags = {
#     Name    = "hoitcsIGW"
#     Project = "hoitcs TF Demo"
#   }
# }

# resource "aws_eip" "hoitcsNatGatewayEIP1" {
#   tags = {
#     Name    = "hoitcsNatGatewayEIP1"
#     Project = "hoitcs TF Demo"
#   }
# }
# resource "aws_nat_gateway" "hoitcsNatGateway1" {
#   allocation_id = aws_eip.hoitcsNatGatewayEIP1.id
#   subnet_id     = aws_subnet.hoitcsPublicSubnet1.id
#   tags = {
#     Name    = "hoitcsNatGateway1"
#     Project = "hoitcs TF Demo"
#   }
# }
# resource "aws_subnet" "hoitcsPublicSubnet1" {
#   vpc_id            = aws_vpc.hoitcsVPC.id
#   cidr_block        = var.public_subnet_cidrs[0]
#   availability_zone = var.availability_zones[0]
#   tags = {
#     Name    = "hoitcsPublicSubnet1"
#     Project = "hoitcs TF Demo"
#   }
# }

# # resource "aws_eip" "hoitcsNatGatewayEIP2" {
# #   tags = {
# #     Name    = "hoitcsNatGatewayEIP2"
# #     Project = "hoitcs TF Demo"
# #   }
# #}

# # resource "aws_nat_gateway" "hoitcsNatGateway2" {
# #   allocation_id = aws_eip.hoitcsNatGatewayEIP2.id
# #   subnet_id     = aws_subnet.hoitcsPublicSubnet1.id
# #   tags = {
# #     Name    = "hoitcsNatGateway2"
# #     Project = "hoitcs TF Demo"
# #   }
# # }

# resource "aws_subnet" "hoitcsPublicSubnet2" {
#   vpc_id            = aws_vpc.hoitcsVPC.id
#   cidr_block        = var.public_subnet_cidrs[1]
#   availability_zone = var.availability_zones[1]
#   tags = {
#     Name    = "hoitcsPublicSubnet2"
#     Project = "hoitcs TF Demo"
#   }
# }

# resource "aws_subnet" "hoitcsPrivateSubnet1" {
#   vpc_id            = aws_vpc.hoitcsVPC.id
#   cidr_block        = var.private_subnet_cidrs[0]
#   availability_zone = var.availability_zones[0]
#   tags = {
#     Name    = "hoitcsPrivateSubnet1"
#     Project = "hoitcs TF Demo"
#   }
# }
# resource "aws_subnet" "hoitcsPrivateSubnet2" {
#   vpc_id            = aws_vpc.hoitcsVPC.id
#   cidr_block        = var.private_subnet_cidrs[1]
#   availability_zone = var.availability_zones[1]
#   tags = {
#     Name    = "hoitcsPrivateSubnet2"
#     Project = "hoitcs TF Demo"
#   }
# }

# resource "aws_route_table" "hoitcsPublicRT" {
#   vpc_id = aws_vpc.hoitcsVPC.id
#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.hoitcsIGW.id
#   }
#   tags = {
#     Name    = "hoitcsPublicRT"
#     Project = "hoitcs TF Demo"
#   }
# }
# resource "aws_route_table" "hoitcsPrivateRT1" {
#   vpc_id = aws_vpc.hoitcsVPC.id
#   route {
#     cidr_block     = "0.0.0.0/0"
#     nat_gateway_id = aws_nat_gateway.hoitcsNatGateway1.id
#   }
#   tags = {
#     Name    = "hoitcsPrivateRT1"
#     Project = "hoitcs TF Demo"
#   }
# }

# resource "aws_route_table_association" "hoitcsPublicRTassociation1" {
#   subnet_id      = aws_subnet.hoitcsPublicSubnet1.id
#   route_table_id = aws_route_table.hoitcsPublicRT.id
# }
# resource "aws_route_table_association" "hoitcsPublicRTassociation2" {
#   subnet_id      = aws_subnet.hoitcsPublicSubnet2.id
#   route_table_id = aws_route_table.hoitcsPublicRT.id
# }

# resource "aws_route_table_association" "hoitcsPrivateRTassociation1" {
#   subnet_id      = aws_subnet.hoitcsPrivateSubnet1.id
#   route_table_id = aws_route_table.hoitcsPrivateRT1.id
# }
# resource "aws_route_table_association" "hoitcsPrivateRTassociation2" {
#   subnet_id      = aws_subnet.hoitcsPrivateSubnet2.id
#   route_table_id = aws_route_table.hoitcsPrivateRT1.id
# }





resource "aws_vpc" "vpc" {
  instance_tenancy = var.instance_tenancy
  cidr_block       = var.vpc_cidr
  tags             = var.vpc_tags
  enable_dns_support = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags   = var.igw_tags
}

resource "aws_eip" "nat_gateway_eip" {
  tags = var.eip_tags
}

resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat_gateway_eip.id
  subnet_id     = aws_subnet.public_subnet_1.id
  tags          = var.nat_gateway_tags
  depends_on = [ aws_internet_gateway.igw ]
}

resource "aws_subnet" "public_subnet_1" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.public_subnet_cidrs[0]
  availability_zone = var.availability_zones[0]
  map_public_ip_on_launch = var.map_public_ip_on_launch
  tags              = var.public_subnet_1_tags
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.public_subnet_cidrs[1]
  availability_zone = var.availability_zones[1]
  map_public_ip_on_launch = var.map_public_ip_on_launch
  tags              = var.public_subnet_2_tags
}

resource "aws_subnet" "private_subnet_1" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.private_subnet_cidrs[0]
  availability_zone = var.availability_zones[0]
  tags              = var.private_subnet_1_tags
}

resource "aws_subnet" "private_subnet_2" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.private_subnet_cidrs[1]
  availability_zone = var.availability_zones[1]
  tags              = var.private_subnet_2_tags
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = var.public_rt_tags
}

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway.id
  }
  tags = var.private_rt_tags
}

resource "aws_route_table_association" "public_rt_association_1" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "public_rt_association_2" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "private_rt_association_1" {
  subnet_id      = aws_subnet.private_subnet_1.id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "private_rt_association_2" {
  subnet_id      = aws_subnet.private_subnet_2.id
  route_table_id = aws_route_table.private_rt.id
}
