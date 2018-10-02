output "admin_sg" {
  value       = "${module.private-subnet.admin_sg}"
  description = "Security Group ID for Admin SG"
}

output "public_subnets" {
  value       = ["${module.public-subnet1.subnet_id}", "${module.public-subnet2.subnet_id}"]
  description = "Public Subnet ID"
}

output "private_subnets" {
  value       = ["${module.private-subnet1.subnet_id}", "${module.private-subnet2.subnet_id}"]
  description = "Private Subnet ID"
}

output "key_name" {
  value = "${module.bastion.key_name}"
}

output "vpc_id" {
  value = "${module.vpc.vpc_id}"
}

output "region" {
  value = "${var.region}"
}
