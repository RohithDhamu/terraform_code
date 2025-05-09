resource "google_container_cluster" "gke" {
  name     = "rohith-private-gke-cluster"
  location = var.region

  networking_mode = "VPC_NATIVE"
  remove_default_node_pool = true
  initial_node_count       = 1

  private_cluster_config {
    enable_private_nodes    = true
    enable_private_endpoint = false
    master_ipv4_cidr_block  = "172.16.0.0/28"
  }

  ip_allocation_policy {}

  release_channel {
    channel = "REGULAR"
  }
  deletion_protection = false

}

resource "google_container_node_pool" "node_pool" {
  name       = "rohith-private-gke-node-pool"
  location   = var.region
  cluster    = google_container_cluster.gke.name
  node_count = 1

  node_config {
    machine_type = "e2-medium"
    spot = true
    disk_size_gb = 50
    image_type   = "COS_CONTAINERD"

    metadata = {
      disable-legacy-endpoints = "true"
    }

    # Ensure NO external IPs
    tags = ["private-gke"]

    shielded_instance_config {
      enable_secure_boot = true
    }
  }
}
