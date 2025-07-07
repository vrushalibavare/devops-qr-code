#!/bin/bash

# Stop and remove old containers if they exist
echo "🔁 Cleaning up old containers..."
docker stop qr-api qr-frontend 2>/dev/null
docker rm qr-api qr-frontend 2>/dev/null

# Backend setup
echo "🐍 Building backend Docker image..."
cd api || exit
docker build -t qr-code-api .

echo "🚀 Running backend container..."
docker run -d --name qr-api -p 8000:8000 --env-file .env qr-code-api

cd ..

# Frontend setup
echo "🧱 Building frontend Docker image..."
cd front-end-nextjs || exit
docker build -t qr-code-frontend .

echo "🚀 Running frontend container..."
docker run -d --name qr-frontend -p 3000:3000 \
  -e NEXT_PUBLIC_API_URL=http://host.docker.internal:8000 \
  qr-code-frontend

cd ..

echo "✅ App is running at http://localhost:3000"
