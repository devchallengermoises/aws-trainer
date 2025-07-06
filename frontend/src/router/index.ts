// router/index.ts
import { createRouter, createWebHistory } from 'vue-router'
import { useAuthStore } from '@/stores/auth'
import { useQuizStore } from '@/stores/quiz'
import LoginPage from '@/pages/LoginPage.vue'
import QuizPage from '@/pages/QuizPage.vue'
import ExamSelectionPage from '@/pages/ExamSelectionPage.vue'

const routes = [
  { path: '/', redirect: '/login' },
  { path: '/login', component: LoginPage },
  { path: '/exam-selection', component: ExamSelectionPage },
  { path: '/quiz', component: QuizPage },
]

const router = createRouter({
  history: createWebHistory(),
  routes,
  scrollBehavior(to, from, savedPosition) {
    if (savedPosition) {
      return savedPosition
    } else {
      return { top: 0 }
    }
  }
})

let isInitialAuthCheckDone = false

router.beforeEach(async (to, from, next) => {
  const auth = useAuthStore()
  const quiz = useQuizStore()

  if (!isInitialAuthCheckDone) {
    if (document.cookie.includes('laravel_session=')) {
      try {
        await auth.fetchUser()
      } catch {
      }
    }
    isInitialAuthCheckDone = true
  }

  if (to.path === '/login') {
    return next()
  }

  if (to.meta.requiresAuth) {
    if (!auth.user) {
      await auth.fetchUser()
      if (!auth.user) {
        return next('/login')
      }
    }

    if (to.path === '/exam-selection' && quiz.isQuizStarted) {
      return next('/quiz')
    }

    if (quiz.isQuizStarted && to.path !== '/quiz' && to.path !== '/exam-selection') {
      return next('/quiz')
    }

    if (to.path === '/quiz') {
      if (!quiz.selectedExamType || !quiz.isQuizStarted) {
        return next('/exam-selection')
      }
    }
  }

  next()
})

export default router