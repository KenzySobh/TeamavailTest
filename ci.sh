#!/usr/bin/env bash
set -euo pipefail

echo "=== CI: Build Docker image ==="
docker build -t teamavail:latest .

echo "=== CI: Docker Compose up ==="
docker compose up -d --build

echo "=== CI: Running containers ==="
docker ps --filter "name=teamavail"

echo "Access the app at http://localhost:3000"
echo "DB running at localhost:5432 (user=teamuser, pass=teampass, db=teamdb)"

