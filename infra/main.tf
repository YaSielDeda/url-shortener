terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.8.0"
    }
  }
}

provider "google" {
  project = var.project
  region  = var.region
  zone    = var.zone
}

resource "google_cloud_run_service" "backend" {
  name     = "backend"
  location = var.region

  template {
    spec {
      containers {
        image = "us-central1-docker.pkg.dev/prod-451318/url-shortener/shortener-backend:0.0.2"
        env {
          name  = "DATABASE_URL"
          value = "postgresql://postgres.xqvdzakecccftfwwzuhy:oftFVyx0b56drt4T@aws-0-eu-central-1.pooler.supabase.com:6543/postgres"
        }
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
}

output "backend_url" {
  value = google_cloud_run_service.backend.status[0].url
}

resource "google_cloud_run_service" "url-shortener-frontend" {
  name     = "url-shortener-frontend"
  location = var.region

  template {
    spec {
      containers {
        ports {
          container_port = 80
        }
        image = "us-central1-docker.pkg.dev/prod-451318/url-shortener/shortener-frontend:0.0.3"
        env {
          name  = "BACKEND_URL"
          value = google_cloud_run_service.backend.status[0].url
        }
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
}

data "google_iam_policy" "noauth" {
  binding {
    role = "roles/run.invoker"
    members = [
      "allUsers",
    ]
  }
}

locals {
  public_services = {
    backend  = google_cloud_run_service.backend.name
    frontend = google_cloud_run_service.url-shortener-frontend.name
  }
}

resource "google_cloud_run_service_iam_member" "noauth" {
  for_each = local.public_services

  location = var.region
  project  = var.project
  service  = each.value

  role   = "roles/run.invoker"
  member = "allUsers"
}
