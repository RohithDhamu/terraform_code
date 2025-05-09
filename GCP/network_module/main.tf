resource "google_compute_network" "vpc" {
  name                    = var.vpc_name
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet" {
  name          = var.subnet_name
  network       = google_compute_network.vpc.id
  region        = var.region
  ip_cidr_range = var.subnet_cidr
}

resource "google_compute_subnetwork" "subnet_2" {
  name          = var.subnet_2_name
  ip_cidr_range = var.subnet_2_cidr
  region        = var.subnet_2_region
  network       = google_compute_network.vpc.id
}


# resource "google_compute_firewall" "allow-internal" {
#   name    = "allow-internal"
#   network = google_compute_network.vpc.id

#   allow {
#     protocol = "icmp"
#   }

#   allow {
#     protocol = "tcp"
#     ports    = ["22", "3389"]
#   }

#   source_ranges = ["10.10.0.0/24"]
# }

# resource "google_compute_router" "router" {
#   name    = "rohith-nat-router"
#   network = google_compute_network.vpc.id
#   region  = var.region
# }

# resource "google_compute_router_nat" "nat" {
#   name                               = "nat-gateway"
#   router                             = google_compute_router.router.name
#   region                             = var.region
#   nat_ip_allocate_option             = "AUTO_ONLY"
#   source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
# }
