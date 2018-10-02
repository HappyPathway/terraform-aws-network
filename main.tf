module "vpc" {
  source       = "github.com/HappyPathway/terraform-aws-vpc"
  version      = "2.2.0"
  vpc_cidr     = "${var.vpc_cidr}"
  network_name = "${var.network_name}"
}

module "public-subnet1" {
  source            = "github.com/HappyPathway/terraform-aws-public-subnet"
  version           = "1.0.2"
  vpc_id            = "${module.vpc.vpc_id}"
  route_table_id    = "${module.vpc.route_table_id}"
  availability_zone = "${element(var.availability_zones, 0)}"
  network_name      = "${var.network_name}00"
  subnet_cidr       = "${var.public_subnet_cidr}"
}

module "public-subnet2" {
  source            = "github.com/HappyPathway/terraform-aws-public-subnet"
  version           = "1.0.2"
  vpc_id            = "${module.vpc.vpc_id}"
  route_table_id    = "${module.vpc.route_table_id}"
  availability_zone = "${element(var.availability_zones, 1)}"
  network_name      = "${var.network_name}01"
  subnet_cidr       = "${var.public_subnet_cidr}"
}

module "private-subnet1" {
  source            = "github.com/HappyPathway/terraform-aws-private-subnet"
  version           = "1.0.2"
  vpc_id            = "${module.vpc.vpc_id}"
  public_subnet_id  = "${module.public-subnet1.subnet_id}"
  availability_zone = "${element(var.availability_zones, 0)}"
  network_name      = "${var.network_name}00"
  subnet_cidr       = "${var.private_subnet_cidr}"
}
  
module "private-subnet2" {
  source            = "github.com/HappyPathway/terraform-aws-private-subnet"
  version           = "1.0.2"
  vpc_id            = "${module.vpc.vpc_id}"
  public_subnet_id  = "${module.public-subnet2.subnet_id}"
  availability_zone = "${element(var.availability_zones, 1)}"
  network_name      = "${var.network_name}01"
  subnet_cidr       = "${var.private_subnet_cidr}"
}
