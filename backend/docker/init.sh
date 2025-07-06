#!/bin/bash

echo "🚀 AWS Trainer Cert - Container Initialization"
echo "=============================================="

# Wait for database to be ready
echo "⏳ Waiting for database to be ready..."
while ! mysqladmin ping -h"$DB_HOST" -u"$DB_USERNAME" -p"$DB_PASSWORD" --silent; do
    sleep 1
done
echo "✅ Database is ready!"

# Install Composer dependencies
echo "📦 Installing Composer dependencies..."
composer install --no-interaction --optimize-autoloader

# Generate application key
echo "🔑 Generating application key..."
php artisan key:generate

# Clear and cache config
echo "⚙️  Optimizing Laravel configuration..."
php artisan config:clear
php artisan config:cache

# Run migrations
echo "🗄️  Running database migrations..."
php artisan migrate --force

# Run seeders
echo "🌱 Running database seeders..."
php artisan exam:seed --force

# Set proper permissions
echo "🔐 Setting proper permissions..."
chown -R www-data:www-data /var/www/storage
chown -R www-data:www-data /var/www/bootstrap/cache
chmod -R 775 /var/www/storage
chmod -R 775 /var/www/bootstrap/cache

echo "✅ Container initialization completed!"
echo ""
echo "📊 Application Summary:"
echo "   - URL: http://localhost:8000"
echo "   - Admin Email: admin@admin.com"
echo "   - Admin Password: Admin!.!"
echo "   - Database: MySQL on localhost:3306"
echo "   - Redis: localhost:6379"
echo "   - Redis Admin: http://localhost:8081"
echo ""
echo "🎯 Ready to study AWS certifications!"

# Start Apache
exec apache2-foreground 