# TeamavailTest – CI/CD with Docker, PostgreSQL, Terraform, and Jenkins

## 📌 Overview
This project is a **Team Availability Tracker** application.  
It consists of:
- A **Node.js Express app** (`server.js`) that serves the frontend and backend.
- A **PostgreSQL database** for persistence.
- A **CI/CD pipeline** powered by **Jenkins** and **Docker**.
- **Terraform** for infrastructure provisioning.

---

---

## ⚙️ Application Workflow
1. User interacts with the frontend served by **Express**.
2. Input JSON files are processed.
3. Data is stored in:
   - **PostgreSQL database** (primary storage).
   - **history.json** file inside the `/output` directory (backup/history).
4. User can view results in the web UI.

---

## 🐳 Docker & Docker Compose

### **Dockerfile (App)**
- Builds the Node.js Express app.
- Installs dependencies.
- Exposes port `3000`.

### **docker-compose.yml**
Defines two services:
1. **App service**
   - Runs Node.js Express app.
   - Maps port `3000:3000`.
2. **PostgreSQL service**
   - Uses `postgres:15`.
   - Environment variables set with:
     ```yaml
     POSTGRES_USER: teamuser
     POSTGRES_PASSWORD: teampass
     POSTGRES_DB: teamdb
     ```
   - Exposes port `5432`.

#### Run the stack:
```bash
docker compose up --build -d
```
when running the docker compose the image is build and postgres database is connected sucessfully 
![docker containers](image.png)

## Data Saved
now when chaning any thing in the data, it is changed in the history.json file and the postgres 

![alt text](image-1.png)
![alt text](image-2.png)

