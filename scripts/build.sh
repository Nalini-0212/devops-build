#!/bin/bash
set -e

echo "Building Docker image: $IMAGE_NAME"

# Ensure Dockerfile path is correct
docker build -t $IMAGE_NAME -f docker/Dockerfile .