variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  default = ["10.0.1.0/24", "10.0.2.0/24"]
  type = "list"
}

variable "private_subnet_cidrs" {
  default = ["10.0.3.0/24", "10.0.4.0/24"]
  type = "list"
}

variable "network_name" {
  type        = "string"
  description = "Specify the name of the network"
}

variable "key_name" {
  type        = "string"
  description = "Specify AWS KeyPair"
}

variable "availability_zones" {
  type        = "list"
  description = "AZ where resources will live"
  default = ["us-east-1b", "us-east-1c"]
}

variable "region" {
  type        = "string"
  description = "Region where resources will live"
}
