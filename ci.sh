#!/usr/bin/env bash
set -euo pipefail

echo "=== CI: build Docker image ==="
docker build -t teamavail:latest .

echo "=== CI: docker compose up ==="
docker compose up -d --build

echo "=== CI: done. Application should be up ==="
docker ps --filter "ancestor=teamavail:latest"
echo "Access the application at http://localhost:3000"
echo "=== CI finished ==="
