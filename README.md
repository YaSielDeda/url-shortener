
# URL Shortener 🚀

This is my educational pet project, created to improve knowledge on the topic of cloud infrastructure.

A simple URL shortener built with **FastAPI**, **PostgreSQL**, and **React**.  
Deployed completely for free using **GCP** as IaaS, **InfinityFree.com** for free domains registration and free PaaS **Supabase.com** as the database.

---

## ✨ Features
- Generate short links with a single click.
- Automatic redirection to the original link.
- Frontend and backend deployed on **Google Cloud Run**.

---

## 📋 Prerequisites
To deploy this project, you need:
1. Register two domains:
   - `api.url-shortener.42web.io` → backend
   - `app.url-shortener.42web.io` → frontend
2. Confirm ownership of both domains in **Google Cloud Run**.

---

## ⚙️ Tech Stack
- **Backend:** FastAPI + SQLAlchemy + PostgreSQL  
- **Frontend:** React  
- **Deployment:** Google Cloud Run + Terraform  
- **Database:** PostgreSQL (Cloud SQL)

---

## 🚀 Deployment
1. Clone the repository

2. Deploy with Terraform:
   - terraform init
   - terraform apply

3. The services will be deployed at:
   - **Frontend:** https://app.url-shortener.42web.io  
   - **Backend:** https://api.url-shortener.42web.io

---

## 🔧 How it works
1. The user enters a long URL in the frontend form.
2. A request is sent to the backend API `/shorten`.
3. The backend generates a short link and saves it in PostgreSQL.
4. When opening the short link, the backend redirects to the original URL.

---

## Key Features Implemented
- URL Shortening Service — implemented backend using FastAPI with persistent storage in PostgreSQL.

- Redirect Service — short links automatically redirect users to the original URLs.

- Frontend Application — built with React, integrated with backend API through dynamic domain configuration.

- Custom Domains — configured app.url-shortener.42web.io and api.url-shortener.42web.io for production-ready deployment.

- CORS & Security — properly configured CORS middleware to restrict allowed origins and secure frontend-backend communication.

- Containerization — both frontend and backend packaged into Docker images for consistent deployment.

- CI/CD with Terraform — infrastructure fully automated and reproducible via Terraform.

## GCP Services Used
- Google Cloud Run — deployed both backend (FastAPI) and frontend (React) as fully managed serverless services.

- Google Artifact Registry — stored and pulled Docker images for both services.

- Google Cloud Domains & SSL — integrated with a custom domain and enabled HTTPS for secure access.

- Google IAM — configured roles and permissions to restrict access to deployment and runtime services.

- Google Cloud DNS — managed DNS records to properly route traffic from custom domains to Cloud Run services.

- Google Cloud Build — automated image builds from source.

## Security & Best Practices
- Restricted service-to-service communication with allowed origins and proper CORS rules.

- Enforced HTTPS by using Cloud Run managed TLS certificates.

- Minimal IAM roles (principle of least privilege) applied to service accounts used by Terraform and Cloud Run.

- Avoided exposing sensitive environment variables in the frontend; backend URL passed dynamically during deployment.

- Database access restricted to backend service only, not publicly exposed.

---

## 📝 License
MIT — free to use and modify.
