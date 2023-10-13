resource "google_storage_bucket" "terraform_backend_bucket" {
      location = "us-west1"
      name = "terraform-state-e7h50yr3xnbzgr7ampqfwz1ob1fk3cvr0a8jr6sxtv5kc"
      project = "PROJECTID"
}

terraform {
  required_providers {
    google =  {
    source = "hashicorp/google"
    version = ">= 4.10.0"
    }
  }
}

provider "google" {
    project = "PROJECTID"
    region = "us-west1"
}

