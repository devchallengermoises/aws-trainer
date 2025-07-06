# 🎨 Quiz App (Frontend - Vue 3 + TypeScript)

This is the frontend of the Quiz App built with **Vue 3**, **TypeScript**, **Pinia**, and **Bootstrap**.

---

## 🚀 Getting Started

### Prerequisites
- Node.js 18+
- Docker running the backend

### Setup

```bash
git clone https://github.com/your-org/quiz-app.git
cd quiz-app
docker-compose up -d
docker exec -it quiz-app bash
npm install
cp .env.example .env

open in the browser http://localhost:5173
```

Make sure your `.env` contains:
```
VITE_API_BASE_URL=http://localhost:8000/api
```

---

## 🔐 Auth Flow
- Protected routes enforced via router guards
- Auto-redirect to `/login` if session invalid
- CSRF token handled via Axios interceptor

---

## 🧠 Quiz Features
- Keeps progress and answer order per user using Redis
- Handles multiple correct answers (checkbox)
- Highlights correct/incorrect answers
- Session survives page reload
- Supports logout and retake flow

---

## 📁 Folder Structure
- `src/pages/` → Pages (LoginPage.vue, QuizPage.vue)
- `src/components/` → Reusable components (e.g. QuestionCard.vue)
- `src/api/` → All API calls (Axios)
- `src/stores/` → Pinia stores
- `src/router/` → Routing with guards

---

## 📦 Docker Compatible
This project runs on:
- 🐧 Linux
- 🪟 Windows
- 🍎 macOS

No setup differences needed. Just run the commands 🎉

---

## ✅ License
MIT or your preferred license.

