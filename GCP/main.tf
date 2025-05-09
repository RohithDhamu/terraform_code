terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

module "network" {
  source      = "./network_module"
  vpc_name    = var.vpc_name
  subnet_name = var.subnet_name
  region      = var.region
  subnet_cidr = var.subnet_cidr
  subnet_2_name  = var.subnet_2_name
  subnet_2_cidr  = var.subnet_2_cidr
  subnet_2_region = var.subnet_2_region
}

# module "compute" {
#   source         = "./compute_module"
#   instance_name  = var.instance_name
#   machine_type   = var.machine_type
#   zone           = var.zone
#   subnet_name    = var.subnet_name
# }

# module "gke" {
#   source       = "./gke_module"
#   cluster_name = var.cluster_name
#   region       = var.region
#   subnet_name  = var.subnet_name
# }
