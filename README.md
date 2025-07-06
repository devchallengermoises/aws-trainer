# AWS Trainer Cert

A comprehensive AWS certification training application with practice exams for SOA-C02, SAA-C03, and DVA-C02 certifications.

## 🚀 Quick Start

### Prerequisites
- Docker
- Docker Compose

### One-Command Setup
```bash
# Clone the repository
git clone https://github.com/devchallengermoises/aws-trainer.git
cd aws-trainer-cert

# Option 1: Use the quick start script (recommended)
./start.sh

# Option 2: Use docker compose directly
docker compose up --build
```

That's it! The application will be ready in a few minutes.

## 📊 Application Information

### Access URLs
- **Frontend Application**: http://localhost:3000
- **Backend API**: http://localhost:8000
- **API Endpoints**: http://localhost:8000/api
- **Redis Admin**: http://localhost:8081

### Default Credentials
- **Email**: admin@admin.com
- **Password**: Admin!.!

### Database Information
- **Host**: localhost
- **Port**: 3306
- **Database**: quiz_db
- **Username**: root
- **Password**: root

## 🏗️ Architecture

### Backend (Laravel)
- **Framework**: Laravel 10
- **PHP Version**: 8.2
- **Database**: MySQL 8
- **Cache**: Redis
- **Web Server**: Apache

### Frontend (Vue.js)
- **Framework**: Vue 3
- **Build Tool**: Vite
- **Language**: TypeScript

## 📚 Available Exams

### SOA-C02 - AWS SysOps Administrator
- **Description**: Certification exam for AWS system administrators
- **Questions**: 3 practice questions
- **Topics**: Monitoring, backup, VPC, CloudWatch, RDS

### SAA-C03 - AWS Solutions Architect
- **Description**: Certification exam for AWS solution architects
- **Questions**: 3 practice questions
- **Topics**: S3, CloudFront, EC2, RDS, high availability

### DVA-C02 - AWS Developer
- **Description**: Certification exam for AWS developers
- **Questions**: 3 practice questions
- **Topics**: Lambda, S3, SQS, API Gateway, Cognito

## 🔧 Development

### Docker Services
- **frontend**: Vue.js application (Port 3000)
- **backend**: Laravel API (Port 8000)
- **db**: MySQL database (Port 3306)
- **redis**: Redis cache (Port 6379)
- **redis-admin**: Redis Commander (Port 8081)

### Useful Commands

#### Start Services
```bash
# Start all services
docker compose up

# Start in background
docker compose up -d

# Rebuild and start
docker compose up --build
```

#### Stop Services
```bash
# Stop all services
docker compose down

# Stop and remove volumes
docker compose down -v
```

#### View Logs
```bash
# View all logs
docker compose logs

# View specific service logs
docker compose logs backend
docker compose logs frontend
docker compose logs db
```

#### Access Containers
```bash
# Access Laravel container
docker compose exec backend bash

# Access frontend container
docker compose exec frontend sh

# Access database
docker compose exec db mysql -u root -p quiz_db
```

### Database Management

#### Reset Database
```bash
# Access Laravel container
docker compose exec backend bash

# Run migrations and seeders
php artisan migrate:fresh --seed
php artisan exam:seed --force
```

#### Backup Database
```bash
# Create backup
docker compose exec db mysqldump -u root -p quiz_db > backup.sql

# Restore backup
docker compose exec -T db mysql -u root -p quiz_db < backup.sql
```

## 📁 Project Structure

```
aws-trainer-cert/
├── backend/                 # Laravel application
│   ├── app/                # Application logic
│   ├── database/           # Migrations and seeders
│   ├── routes/             # API routes
│   ├── docker/             # Docker configuration
│   └── docker-compose.yml  # Docker services
├── frontend/               # Vue.js application
│   ├── src/               # Source code
│   ├── public/            # Public assets
│   └── package.json       # Dependencies
└── README.md              # This file
```

## 🔒 Security

### Environment Variables
The application uses the following environment variables:
- `DB_HOST`: Database host
- `DB_DATABASE`: Database name
- `DB_USERNAME`: Database username
- `DB_PASSWORD`: Database password
- `REDIS_HOST`: Redis host
- `REDIS_PORT`: Redis port

### Default Credentials
⚠️ **Important**: Change default credentials in production!

## 🐛 Troubleshooting

### Common Issues

#### Port Already in Use
```bash
# Check what's using the port
lsof -i :8000

# Kill the process
kill -9 <PID>
```

#### Database Connection Issues
```bash
# Check if database is running
docker-compose ps

# Restart database
docker-compose restart db
```

#### Permission Issues
```bash
# Fix Laravel permissions
docker compose exec backend chown -R www-data:www-data /var/www/storage
docker compose exec backend chmod -R 775 /var/www/storage
```

### Reset Everything
```bash
# Stop and remove everything
docker compose down -v

# Remove all images
docker system prune -a

# Start fresh
docker compose up --build
```

## 📝 API Documentation

### Authentication
All API endpoints require authentication except login.

### Endpoints
- `POST /api/login` - User login
- `GET /api/exam-types` - Get available exam types
- `GET /api/questions/{examType}` - Get questions for exam type
- `POST /api/quiz/start` - Start a new quiz
- `POST /api/quiz/submit-answer` - Submit an answer
- `POST /api/quiz/finish` - Finish the quiz

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests if applicable
5. Submit a pull request

## 📄 License

This project is licensed under the MIT License.

## 🆘 Support

If you encounter any issues:
1. Check the troubleshooting section
2. Review the logs: `docker compose logs`
3. Create an issue in the repository

---

**Happy studying! 🎯** 