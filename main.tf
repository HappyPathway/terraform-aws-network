#
module "vpc" {
  source  = "HappyPathway/vpc/aws"
  vpc_cidr     = "${var.vpc_cidr}"
  network_name = "${var.network_name}"
}

module "public-subnet" {
  source  = "HappyPathway/public-subnet/aws"
  count   = length(var.public_subnet_cidrs)
  vpc_id            = "${module.vpc.vpc_id}"
  route_table_id    = "${module.vpc.route_table_id}"
  availability_zone = "${element(var.availability_zones, count.index)}"
  network_name      = "${var.network_name}-public-${split("/", element(var.public_subnet_cidrs, count.index))[0]}"
  subnet_cidr       = element(var.public_subnet_cidrs, count.index)
}

module "private-subnet" {
  source  = "HappyPathway/private-subnet/aws"
  count = length(var.private_subnet_cidrs)
  vpc_id            = "${module.vpc.vpc_id}"
  public_subnet_id  = "${element(module.public-subnet, count.index).subnet_id}"
  availability_zone = "${element(var.availability_zones, count.index)}"
  network_name      = "${var.network_name}-private00"
  subnet_cidr       = "${element(var.private_subnet_cidrs, count.index)}"
}
