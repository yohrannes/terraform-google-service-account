provider "google" {
  credentials = var.credentials_path != "" ? file(var.credentials_path) : null
  project     = var.project_id
  region      = var.region
}

resource "local_file" "service_account_credentials" {
  content         = base64decode(google_service_account_key.tf-web-port-sa-key[0].private_key)
  filename        = pathexpand("~/.gcp/tf-sa-key.json")
  file_permission = "0664"
  count        = var.enable_sa_resource ? 1 : 0
}

resource "google_service_account" "tf-web-port-sa" {
  account_id   = var.service_account_name
  display_name = var.service_account_name
  project      = var.project_id
  count        = var.enable_sa_resource ? 1 : 0
}

resource "google_service_account_key" "tf-web-port-sa-key" {
  service_account_id = google_service_account.tf-web-port-sa[0].name
  count              = var.enable_sa_resource ? 1 : 0
}

resource "google_project_iam_binding" "owner_binding" {
  project = var.project_id
  role    = "roles/editor"
  members = ["serviceAccount:${google_service_account.tf-web-port-sa[0].email}"]
  count   = var.enable_sa_resource ? 1 : 0
}

resource "google_project_iam_binding" "config_agent_binding" {
  project = var.project_id
  role    = "roles/config.agent"
  members = ["serviceAccount:${google_service_account.tf-web-port-sa[0].email}"]
  count   = var.enable_sa_resource ? 1 : 0
}

resource "google_project_iam_binding" "viewer_binding" {
  project = var.project_id
  role    = "roles/viewer"
  members = ["serviceAccount:${google_service_account.tf-web-port-sa[0].email}"]
  count   = var.enable_sa_resource ? 1 : 0
}