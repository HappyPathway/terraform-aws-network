output "admin_sgs" {
  value       = [for subnet in module.private-subnet : subnet.admin_sg]
  description = "Security Group ID for Admin SG"
}

output "public_subnets" {
  value       = [for subnet in module.public-subnet: subnet.subnet_id]
  description = "Public Subnet ID"
}

output "private_subnets" {
  value       = [for subnet in module.private-subnet: subnet.subnet_id]
  description = "Private Subnet ID"
}

output "key_name" {
  value = "${var.key_name}"
}

output "vpc_id" {
  value = "${module.vpc.vpc_id}"
}

output "region" {
  value = "${var.region}"
}
