terraform {
  required_version = ">= 1.8.5"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 5.33.0"
    }
  }
}

provider "google" {
  project = "fourth-silo-459115-u0"
  region  = "us-central1"
  zone    = "us-central1-a"
}

# Create VPC Network
resource "google_compute_network" "vpc_network" {
  name                    = "swim-network"
  auto_create_subnetworks = false
}

# Create Subnetwork
resource "google_compute_subnetwork" "subnet" {
  name          = "swim-subnet"
  ip_cidr_range = "10.0.1.0/24"
  region        = "us-central1"
  network       = google_compute_network.vpc_network.id
}

# Create Firewall to allow SSH and HTTP
resource "google_compute_firewall" "default" {
  name    = "swim-allow-ssh-http"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "tcp"
    ports    = ["22", "80"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["swim-vm"]
}

# Create the VM
resource "google_compute_instance" "vm_instance" {
  name         = "swim-vm"
  zone         = "us-central1-a"
  machine_type = "custom-2-13312"  
  
  tags = ["swim-vm"]

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
    }
  }

  network_interface {
    network    = google_compute_network.vpc_network.id
    subnetwork = google_compute_subnetwork.subnet.id
    access_config {}  # Public IP
  }
}
