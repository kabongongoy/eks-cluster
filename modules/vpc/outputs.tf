output "vpc_id" {
  value = aws_vpc.vpc.id
}

 output "private_subnet_ids" {
  value = [aws_subnet.private_subnet_1.id, aws_subnet.private_subnet_2.id]  
 }


 output "public_subnet_ids" {
  value = [aws_subnet.public_subnet_1.id, aws_subnet.public_subnet_2.id]  
 }




 


# output "public_subnets" {
#   description = "Will be used by Web Server Module to set subnet_ids"
#   value = [
#     aws_subnet.hoitcsPublicSubnet1,
#     aws_subnet.hoitcsPublicSubnet2
#   ]
# }
# output "private_subnets" {
#   description = "Will be used by RDS Module to set subnet_ids"
#   value = [
#     aws_subnet.hoitcsPrivateSubnet1,
#     aws_subnet.hoitcsPrivateSubnet2
#   ]
# }




# vpc-module/outputs.tf
# output "vpc_id" {
#   value       = aws_vpc.vpc.id
#   description = "The ID of the VPC"
# }

# output "public_subnet_ids" {
#   value       = [aws_subnet.Public_Subnet_1.id, aws_subnet.Public_Subnet_2.id]
#   description = "IDs of the public subnets"
# }

# output "private_subnet_ids" {
#   value       = [aws_subnet.Private_Subnet_1.id, aws_subnet.Private_Subnet_2.id]
#   description = "IDs of the private subnets"
#}

  # output "public_subnet_ids" {
  #   value = aws_subnet.public_subnet_2.id
    
  # }
# output "private_subnet_ids" {
#     value = aws_subnet.private_subnet_2.id
    
#   }
