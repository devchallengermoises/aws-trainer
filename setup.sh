#!/bin/bash

set -e

echo "🚀 AWS Trainer Cert - Setup"
echo "============================="

# Install backend dependencies
if [ -d "backend" ]; then
  echo "📦 Installing backend dependencies (composer)..."
  cd backend
  if [ ! -d "vendor" ]; then
    composer install
  else
    echo "vendor directory already exists. Skipping composer install."
  fi
  
  # Setup .env file if it doesn't exist
  echo "🔧 Setting up environment configuration..."
  if [ ! -f ".env" ]; then
    if [ -f ".env.example" ]; then
      cp .env.example .env
      echo "✅ Created .env file from .env.example"
    else
      echo "❌ .env.example not found. Please create .env file manually."
      exit 1
    fi
  else
    echo "✅ .env file already exists"
  fi
  
  # Clear Laravel caches to ensure fresh configuration
  echo "🧹 Clearing Laravel caches..."
  php artisan config:clear
  php artisan cache:clear
  echo "✅ Laravel caches cleared"
  
  cd ..
fi

# Install frontend dependencies
if [ -d "frontend" ]; then
  echo "📦 Installing frontend dependencies (npm)..."
  cd frontend
  if [ ! -d "node_modules" ]; then
    npm install
  else
    echo "node_modules directory already exists. Skipping npm install."
  fi
  cd ..
fi

echo "✅ Dependencies installed!"

echo ""
echo "🚀 Starting AWS Trainer Cert application with Docker Compose..."
docker compose up --build

echo ""
echo "🎉 Application started successfully!"
echo ""
echo "📊 Access Information:"
echo "   - Frontend: http://localhost:3000"
echo "   - Backend API: http://localhost:8000"
echo "   - Redis Admin: http://localhost:8081"
echo ""
echo "🔐 Default Credentials:"
echo "   - Email: admin@admin.com"
echo "   - Password: Admin!.!"
echo ""
echo "📚 Available Exams:"
echo "   - SOA-C02 (SysOps Administrator)"
echo "   - SAA-C03 (Solutions Architect)"
echo "   - DVA-C02 (Developer)"
echo ""
echo "�� Happy studying!" 