module "vpc" {
  source       = "github.com/HappyPathway/terraform-aws-vpc"
  version      = "1.0.1"
  cidr     = "${var.vpc_cidr}"
  name = "${var.network_name}"
  azs = ["${var.availability_zone}"]
  enable_nat_gateway = true
  public_subnets = ["${var.public_subnet_cidr}"]
  private_subnets = ["${var.private_subnet_cidr}"]
}

module "public-subnet" {
  source            = "github.com/HappyPathway/terraform-aws-public-subnet"
  version           = "1.0.2"
  vpc_id            = "${module.vpc.vpc_id}"
  route_table_id    = "${element(module.vpc.public_route_table_ids, 0)}"
  availability_zone = "${var.availability_zone}"
  network_name      = "${var.network_name}"
  subnet_cidr       = "${var.public_subnet_cidr}"
}

module "private-subnet" {
  source            = "github.com/HappyPathway/terraform-aws-private-subnet"
  version           = "1.0.2"
  vpc_id            = "${module.vpc.vpc_id}"
  public_subnet_id  = "${module.public-subnet.subnet_id}"
  availability_zone = "${var.availability_zone}"
  network_name      = "${var.network_name}"
  subnet_cidr       = "${var.private_subnet_cidr}"
}

module "bastion" {
  source           = "github.com/HappyPathway/terraform-aws-bastion"
  version          = "1.0.2"
  admin_sg         = "${module.private-subnet.admin_sg}"
  network_name     = "${var.network_name}"
  key_name         = "${var.key_name}"
  public_subnet_id = "${module.public-subnet.subnet_id}"
  ssh_access       = "0.0.0.0/0"
  vpc_id           = "${module.vpc.vpc_id}"
}
