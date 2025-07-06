# 📦 Quiz API (Backend - Laravel)

This is the backend of the Quiz App built with **Laravel**, running on **Docker** with **Redis** for session and quiz state management.

---

## 🚀 Getting Started

### Prerequisites
- Docker Desktop
- Docker Compose

### Setup

```bash
git clone https://github.com/your-org/quiz-api.git
cd quiz-api
cp .env.example .env
docker-compose up -d
```

Then run:
```bash
docker exec -it quiz-laravel composer install
docker exec -it quiz-laravel php artisan key:generate
docker exec -it quiz-laravel php artisan migrate
docker exec -it quiz-laravel php artisan db:seed

docker exec -it quiz-laravel bash
php artisan tinker
$user = \App\Models\User::find(1);
$token = $user->createToken('frontend')->plainTextToken;

 Save the token you will need it to connect the FE and BE
```

### Redis
We use Redis to:
- Store quiz session data
- Maintain progress and answer order per user

---

## 📂 Structure Highlights
- `routes/api.php` → All API routes (protected by Sanctum)
- `app/Services/QuizSessionStore.php` → Redis-based session logic
- `app/Http/Controllers/QuizController.php` → Quiz logic (start, fetch question, answer, finish)

---

## 🔒 Authentication
- Login with `/api/login`
- Uses Laravel Sanctum and cookie-based auth

---