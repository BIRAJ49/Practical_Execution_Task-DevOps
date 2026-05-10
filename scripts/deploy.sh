#!/usr/bin/env bash
set -euo pipefail

APP_URL="${APP_URL:-http://localhost:8000}"

echo "Starting deployment setup..."

if ! command -v docker >/dev/null 2>&1; then
    echo "Docker is not installed or not available in PATH."
    exit 1
fi

if ! docker info >/dev/null 2>&1; then
    echo "Docker daemon is not running. Start Docker Desktop and try again."
    exit 1
fi

if [ ! -f .env ] && [ -f .env.example ]; then
    cp .env.example .env
    echo "Created .env from .env.example."
fi

echo "Validating Docker Compose configuration..."
docker compose config >/dev/null

echo "Building and starting containers..."
docker compose up --build -d

echo "Waiting for application health check..."
for attempt in {1..10}; do
    if curl -fsS "${APP_URL}/health" >/dev/null; then
        echo "Application is healthy at ${APP_URL}/health"
        docker compose ps
        exit 0
    fi

    echo "Health check attempt ${attempt}/10 failed. Retrying..."
    sleep 3
done

echo "Application did not become healthy. Showing app logs:"
docker compose logs app
exit 1
