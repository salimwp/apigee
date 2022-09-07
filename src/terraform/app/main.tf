provider "google" {
  project     = "kinetic-pilot-360310"
  region      = "us-west1"
}

resource "google_compute_firewall" "https-strapi" {
    name = "allow-https"
    allow {
        ports = ["443"]
        protocol = "tcp"
    }

    direction   = "INGRESS"
    network     = "default"
    priority    = 1100
    source_ranges   = ["0.0.0.0/0"]
    target_tags = ["https"]
}

resource "google_compute_firewall" "ssh-strapi" {
  name = "allow-ssh"
  allow {
    ports    = ["22"]
    protocol = "tcp"
  }
  direction     = "INGRESS"
  network       = "default"
  priority      = 1000
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["ssh"]
}


# Create a single Compute Engine instance
resource "google_compute_instance" "default" {
  name         = "k3s-vm"
  machine_type = "e2-standard-2"
  zone         = "us-west1-a"
  tags         = ["ssh","https"]

  allow_stopping_for_update = true

  metadata = {
    enable-oslogin = "TRUE"
  }
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"

    access_config {
      # Include this section to give the VM an external IP address
    }
  }
}