resource "google_artifact_registry_repository" "artifact-repo" {
  repository_id = var.name_of_repo 
  provider      = google-beta
  project       = var.project_id
  location      = var.location
  kms_key_name  = var.kms_key_name
  format        = var.format
  mode          = var.mode
   docker_config {
    immutable_tags = var.format == "DOCKER" ? true : false
  } 
  lifecycle {
    ignore_changes = [ cleanup_policies ]
  }
}
