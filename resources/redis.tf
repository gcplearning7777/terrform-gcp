resource "google_compute_network" "ews-net-npe-dev" {
  name = "ews-net-npe-dev"
  auto_create_subnetworks = "false"
  routing_mode = "REGIONAL"
}


resource "google_compute_subnetwork" "ews-sub-net-npe-dev" {
  name          = "ews-sub-net-npe-dev"
  ip_cidr_range = "10.152.0.0/20"
  region        = "australia-southeast1"
  network       = google_compute_network.ews-net-npe-dev.id
 
}


resource "google_compute_firewall" "default" {
  name    = "test-firewall"
  network = google_compute_network.ews-net-npe-dev.name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["80", "8080", "1000-2000","443"]
  }

  source_tags = ["web"]
}




resource "google_redis_instance" "redis-payroll-cache" {
  name           = "redis-memory-cache"
  tier           = "BASIC"
  memory_size_gb = 1

  location_id             = "us-central1-a"
 

  authorized_network = google_compute_network.ews-net-npe-dev.id

  redis_version     = "REDIS_4_0"
  display_name      = "Terraform Test Instance"
 

  labels = {
    my_key    = "my_val"
    other_key = "other_val"
  }
}