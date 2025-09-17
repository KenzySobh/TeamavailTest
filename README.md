# TeamAvail — Local CI/CD Pipeline

TeamAvail is a simple **team availability tracker** that demonstrates a **minimal local CI/CD setup** using **Node.js, Docker, and Docker Compose**

---

## 🚀 Requirements

Before you start, make sure you have the following installed:

- **Docker** ([Install Guide](https://docs.docker.com/get-docker/))  
- **Docker Compose** ([Install Guide](https://docs.docker.com/compose/install/))  
- **Node.js** (optional, for local development outside Docker)  
---

## 🛠️ Setup Instructions

### 1. Clone the repository

```bash
git clone https://github.com/KenzySobh/TeamavailTest.git
cd TeamavailTest
```
### 2. Build and run the applicatio
Use the provided CI script to build the Docker image and start the app:
```bash
./ci.sh
```