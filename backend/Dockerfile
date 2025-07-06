# Use official PHP 8.2 image with Apache
FROM php:8.2-apache

# Install system dependencies + php-redis
RUN apt-get update && apt-get install -y \
    zip unzip git curl libpng-dev libjpeg-dev libpq-dev libonig-dev libxml2-dev \
    && docker-php-ext-install pdo pdo_mysql gd mbstring xml \
    && pecl install redis \
    && docker-php-ext-enable redis

# Enable Apache mod_rewrite
RUN a2enmod rewrite

# Set working directory
WORKDIR /var/www

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Copy Laravel project files
COPY . /var/www

# Install MySQL client for database health check
RUN apt-get update && apt-get install -y default-mysql-client

# Set permissions
RUN chown -R www-data:www-data /var/www

# Set Apache to serve Laravel
COPY ./docker/apache/000-default.conf /etc/apache2/sites-available/000-default.conf

# Copy initialization script
COPY ./docker/init.sh /usr/local/bin/init.sh
RUN chmod +x /usr/local/bin/init.sh

# Expose port 80
EXPOSE 80

# Use initialization script as entrypoint
CMD ["/usr/local/bin/init.sh"]
