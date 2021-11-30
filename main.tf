#
module "vpc" {
  source  = "app.terraform.io/roknsound/vpc/aws"
  version = "2.0.0"
  vpc_cidr     = "${var.vpc_cidr}"
  network_name = "${var.network_name}"
}

module "public-subnet1" {
  source  = "app.terraform.io/roknsound/public-subnet/aws"
  version = "1.0.2"
  vpc_id            = "${module.vpc.vpc_id}"
  route_table_id    = "${module.vpc.route_table_id}"
  availability_zone = "${element(var.availability_zones, 0)}"
  network_name      = "${var.network_name}-public00"
  subnet_cidr       = "${element(var.public_subnet_cidrs, 0)}"
}

module "public-subnet2" {
  source  = "app.terraform.io/roknsound/public-subnet/aws"
  version = "1.0.2"
  vpc_id            = "${module.vpc.vpc_id}"
  route_table_id    = "${module.vpc.route_table_id}"
  availability_zone = "${element(var.availability_zones, 1)}"
  network_name      = "${var.network_name}-public01"
  subnet_cidr       = "${element(var.public_subnet_cidrs, 1)}"
}

module "private-subnet1" {
  source  = "app.terraform.io/roknsound/private-subnet/aws"
  version = "1.0.3"
  vpc_id            = "${module.vpc.vpc_id}"
  public_subnet_id  = "${module.public-subnet1.subnet_id}"
  availability_zone = "${element(var.availability_zones, 0)}"
  network_name      = "${var.network_name}-private00"
  subnet_cidr       = "${element(var.private_subnet_cidrs, 0)}"
}
  
module "private-subnet2" {
  source  = "app.terraform.io/roknsound/private-subnet/aws"
  version = "1.0.3"
  vpc_id            = "${module.vpc.vpc_id}"
  public_subnet_id  = "${module.public-subnet2.subnet_id}"
  availability_zone = "${element(var.availability_zones, 1)}"
  network_name      = "${var.network_name}-private01"
  subnet_cidr       = "${element(var.private_subnet_cidrs, 1)}"
}
