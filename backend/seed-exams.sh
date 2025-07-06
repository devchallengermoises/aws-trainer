#!/bin/bash

# Script to wipe and seed exam data
# Usage: ./seed-exams.sh [--force]

echo "🚀 AWS Trainer Cert - Exam Data Seeder"
echo "======================================"

# Check if we're in the correct directory
if [ ! -f "artisan" ]; then
    echo "❌ Error: artisan file not found. Make sure you're in the backend directory."
    exit 1
fi

# Check if Laravel is installed
if [ ! -d "vendor" ]; then
    echo "📦 Installing Laravel dependencies..."
    composer install
fi

# Check if migrations are executed
echo "🔍 Checking migrations..."
php artisan migrate:status --no-ansi

# Execute seeding command
echo ""
echo "🌱 Running exam seeders..."

if [ "$1" = "--force" ]; then
    php artisan exam:seed --force
else
    php artisan exam:seed
fi

# Check the result
if [ $? -eq 0 ]; then
    echo ""
    echo "✅ Seeding completed successfully!"
    echo ""
    echo "📊 Summary of created data:"
    echo "   - Exam types: 3 (SOA-C02, SAA-C03, DVA-C02)"
    echo "   - Questions per exam: 3"
    echo "   - Total questions: 9"
    echo "   - Answers per question: 4-6"
    echo ""
    echo "🎯 Data is ready for studying!"
else
    echo ""
    echo "❌ Error during seeding. Check logs for more details."
    exit 1
fi 