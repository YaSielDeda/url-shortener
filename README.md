
# URL Shortener 🚀

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

## 📝 License
MIT — free to use and modify.
