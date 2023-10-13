terraform {
  backend "gcs" {
      bucket = "terraform-state-e7h50yr3xnbzgr7ampqfwz1ob1fk3cvr0a8jr6sxtv5kc"
      prefix = "terraform/state"
  }
}

resource "google_compute_instance" "gce-tbye" {
      name = "gce-tbye"
      machine_type = "f1-micro"
      zone = "us-west1-a"
      network_interface {
        network = "default"
      }
      boot_disk {
        initialize_params {
          image = "ubuntu-2004-focal-v20220204"
        }
      }
      project = "PROJECTID"
}

resource "google_project_service" "gce-tbye-service" {
      disable_on_destroy = false
      service = "compute.googleapis.com"
}




