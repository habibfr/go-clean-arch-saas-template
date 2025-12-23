#!/bin/bash

echo "🚀 Go SaaS Starter - Setup Script"
echo "=================================="

# Check if .env exists
if [ ! -f .env ]; then
    echo "❌ .env file not found!"
    exit 1
fi

# Load .env
source .env

# Create database if not exists
if PGPASSWORD=${DB_PASSWORD} psql -U ${DB_USERNAME} -h ${DB_HOST} -p ${DB_PORT} -lqt | cut -d \| -f 1 | grep -qw ${DB_NAME}; then
    echo "✅ Database ${DB_NAME} already exists"
else
    echo "📦 Creating database..."
    PGPASSWORD=${DB_PASSWORD} createdb -U ${DB_USERNAME} -h ${DB_HOST} -p ${DB_PORT} ${DB_NAME} || {
        echo "⚠️  Could not create database. Please create manually: ${DB_NAME}"
    }
fi

# Run migrations
echo "📦 Running migrations..."
make migrate-up

# Seed data
echo "🌱 Seeding initial data..."
make seed

echo ""
echo "✅ Setup complete!"
echo "📖 Run 'make dev' to start development server"
