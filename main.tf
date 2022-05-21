resource "google_storage_bucket" "default" {
  name          = "hillel_18_podmogylnyi"
  location      = "US"
  force_destroy = true

  uniform_bucket_level_access = true
}

resource "google_compute_instance" "default" {
  name         = "compute-instance"
  machine_type = "f1-micro"

#  tags = ["foo", "bar"]

  boot_disk {
    initialize_params {
      image = "debian-9-stretch-v20220519"
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
    }
  }

  metadata_startup_script = "apt update && apt install nginx -y"
}

output "external_ip" {
  value = google_compute_instance.default.network_interface.0.access_config.0.nat_ip
}

output "bucket_url" {
  value = google_storage_bucket.default.self_link
}
