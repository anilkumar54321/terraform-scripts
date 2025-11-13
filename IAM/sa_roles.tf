
variable "roles" {
  type = list(string)
  default = [
    "roles/run.admin",
    "roles/iam.serviceAccountAdmin",
    "roles/iam.serviceAccountUser",
    "roles/storage.admin",
    "roles/secretmanager.admin",
    "roles/pubsub.admin",
    "roles/resourcemanager.projectIamAdmin",
    "roles/storage.objectAdmin",
    "roles/recommender.iamViewer",
    "roles/logging.admin",
    "roles/monitoring.admin",
    "roles/bigquery.admin",
    "roles/cloudfunctions.admin",
    "roles/workflows.admin",
    "roles/cloudscheduler.admin",
  ]
}
resource "google_project_iam_member" "service_account_roles" {
  count  = length(var.roles)
  role   = var.roles[count.index]
  member = "serviceAccount:sa-github-actions@project.iam.gserviceaccount.com"
  project = "project"
}
