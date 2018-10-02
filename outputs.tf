output "admin_sgs" {
  value       = ["${module.private-subnet1.admin_sg}", "${module.private-subnet2.admin_sg}"]
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
  value = "${var.key_name}"
}

output "vpc_id" {
  value = "${module.vpc.vpc_id}"
}

output "region" {
  value = "${var.region}"
}
