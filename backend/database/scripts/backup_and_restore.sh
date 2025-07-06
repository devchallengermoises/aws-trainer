#!/bin/bash

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Database configuration
DB_NAME="quiz_db"
DB_USER="root"
DB_PASSWORD="root"
BACKUP_DIR="./database/backups"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_FILE="${BACKUP_DIR}/backup_${TIMESTAMP}.sql"

# Create backup directory if it doesn't exist
mkdir -p $BACKUP_DIR

echo -e "${YELLOW}Starting database backup and restore process...${NC}"

# Backup current database
echo -e "${YELLOW}Creating backup of current database...${NC}"
docker compose exec db mysqldump -u$DB_USER -p$DB_PASSWORD $DB_NAME > $BACKUP_FILE

if [ $? -eq 0 ]; then
    echo -e "${GREEN}Backup created successfully at: ${BACKUP_FILE}${NC}"
else
    echo -e "${RED}Backup failed!${NC}"
    exit 1
fi

# Drop and recreate database
echo -e "${YELLOW}Recreating database...${NC}"
docker compose exec db mysql -u$DB_USER -p$DB_PASSWORD -e "DROP DATABASE IF EXISTS $DB_NAME; CREATE DATABASE $DB_NAME;"

if [ $? -eq 0 ]; then
    echo -e "${GREEN}Database recreated successfully${NC}"
else
    echo -e "${RED}Database recreation failed!${NC}"
    exit 1
fi

# Run migrations and seeders
echo -e "${YELLOW}Running migrations and seeders...${NC}"
docker compose exec app php artisan migrate:fresh --seed

if [ $? -eq 0 ]; then
    echo -e "${GREEN}Migrations and seeders completed successfully${NC}"
else
    echo -e "${RED}Migrations and seeders failed!${NC}"
    exit 1
fi

echo -e "${GREEN}Process completed successfully!${NC}" 