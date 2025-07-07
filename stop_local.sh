#!/bin/bash

echo "🛑 Stopping frontend and backend containers..."
docker stop qr-frontend qr-api 2>/dev/null

echo "🧹 Removing containers..."
docker rm qr-frontend qr-api 2>/dev/null

echo "✅ Containers stopped and removed."
