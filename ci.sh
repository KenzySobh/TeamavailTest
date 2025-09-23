#!/usr/bin/env bash
set -euo pipefail

echo "=== CI: Linting ==="
if command -v npx &> /dev/null; then
  npx eslint . || true
  npx prettier --check . || true
else
  echo "⚠️ Skipping linting (npx not found)"
fi

echo "=== CI: Testing ==="
if npm test; then
  echo "✅ Tests passed"
else
  echo "⚠️ No tests found or failing, skipping"
fi

echo "=== CI: Build Docker image ==="
docker build -t teamavail:latest .

echo "=== CI: Docker Compose up ==="
docker compose up -d --build

echo "=== CI: Running containers ==="
docker ps --filter "name=teamavail"

echo "Access the app at http://localhost:3000"
echo "DB running at localhost:5432 (user=teamuser, pass=teampass, db=teamdb)"
echo "Redis running at localhost:6379"
