#!/bin/bash
set -e

echo "Pulling latest image..."
docker pull $IMAGE_NAME

echo "Stopping existing container..."
docker compose -f docker/docker-compose.yml down || true

echo "Starting application..."
IMAGE_NAME=$IMAGE_NAME docker compose -f docker/docker-compose.yml up -d