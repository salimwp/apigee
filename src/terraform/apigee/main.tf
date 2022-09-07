provider "google" {
  project     = "kinetic-pilot-360310"
  region      = "us-west1"
}

#resource "google_project_service" "gcp_services" {
#  for_each = toset(var.gcp_service_list)
#  project = var.project_id
#  service = each.key
#}

resource "google_compute_network" "apigee_network" {
  name       = "apigee-network"
}

resource "google_compute_global_address" "apigee_range" {
  name          = "apigee-range"
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = 16
  network       = google_compute_network.apigee_network.id
}

resource "google_service_networking_connection" "apigee_vpc_connection" {
  network                 = google_compute_network.apigee_network.id
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.apigee_range.name]
}

resource "google_apigee_organization" "apigee_org" {
  analytics_region   = "us-west1"
  project_id         = var.project_id
  authorized_network = google_compute_network.apigee_network.id
  depends_on         = [google_service_networking_connection.apigee_vpc_connection]
}

resource "google_apigee_environment" "env" {
  name         = "prod"
  description  = "Prod Environment"
  display_name = "Prod"
  org_id       = google_apigee_organization.apigee_org.id
}

resource "google_apigee_environment" "env_dev" {
  name         = "dev"
  description  = "Dev Environment"
  display_name = "Dev"
  org_id       = google_apigee_organization.apigee_org.id
}

resource "google_apigee_instance" "apigee_instance" {
  name     = "eval-instance"
  location = "us-west1"
  org_id   = google_apigee_organization.apigee_org.id
}

resource "google_apigee_envgroup" "envgrp_dev" {
  name      = "restaurant-dev"
  hostnames = ["apigee-dev.elysautus.io","apigee-test.elysautus.io"]
  org_id    = google_apigee_organization.apigee_org.id
}

resource "google_apigee_envgroup" "envgrp_prod" {
  name      = "restaurant-prod"
  hostnames = ["apigee.elysautus.io"]
  org_id    = google_apigee_organization.apigee_org.id
}
