# output subnet_private_zone1_id {
#   value = aws_subnet.private_zone1.id
# }

# output subnet_private_zone2_id {
#   value = aws_subnet.private_zone2.id
# }

# output subnet_public_zone1_id {
#   value = aws_subnet.public_zone1.id
# }

# output subnet_public_zone2_id {
#   value = aws_subnet.public_zone2.id
# }


# output vpc_id {
#   value = aws_vpc.main.id
# }

# output public_subnet_ids {
output "vpc_id" {
  value       = module.vpc.vpc_id
  description = "The ID of the created VPC"
}

output "public_subnet_ids" {
  value       = module.vpc.public_subnet_ids
  description = "IDs of the public subnets"
}

output "private_subnet_ids" {
  value       = module.vpc.private_subnet_ids
  description = "IDs of the private subnets"
}
