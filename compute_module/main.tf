resource "google_compute_instance" "vm" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.zone
  

  boot_disk {
    initialize_params {
      image = "windows-2022"
      size = 50
    }
  }

  network_interface {
    subnetwork = var.subnet_name
  }
}
