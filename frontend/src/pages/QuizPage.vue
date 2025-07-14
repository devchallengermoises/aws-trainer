<template>
  <div class="min-vh-100 bg-light py-5 px-3">
    <div class="container">
      <div class="mx-auto bg-white shadow-sm rounded-3 p-5" style="max-width: 960px;">
        <div v-if="loading" class="text-center">Loading quiz...</div>

        <div v-else-if="quizFinished">
          <div class="text-center">
            <h3>🎉 Quiz Completed!</h3>
            <p class="fw-bold">
              Score: {{ score?.correct_answers }}/{{ score?.total_questions }}
              ({{ score?.score_percent }}%)
            </p>
            <div class="d-flex justify-content-center gap-2 mt-3">
              <button @click="resetQuiz" class="btn btn-outline-primary">Retake Quiz</button>
              <button @click="abortTest" class="btn btn-outline-success">Exam Selection</button>
            </div>
          </div>
        </div>

        <div v-else>
          <div class="d-flex justify-content-between mb-3">
            <small>Question {{ currentIndex + 1 }} of {{ totalQuestions }}</small>
            <div class="text-end">
              <button class="btn btn-outline-success btn-sm me-2" @click="abortTest">Exam Selection</button>
              <button class="btn btn-outline-danger btn-sm" @click="logout">Sign Out</button>
            </div>
          </div>
          <transition name="fade-slide" mode="out-in">
            <QuestionCard
              v-if="currentQuestion"
              :key="currentQuestion.id"
              :question="currentQuestion"
              :question-number="currentIndex + 1"
              :total-questions="totalQuestions"
              :highlight-correct="correctAnswerIds"
              :saved-state="quizStore.userAnswers[currentQuestion.id]"
              @answered="handleAnswer"
            >
              <template #next-button>
                <transition name="fade-scale">
                  <button
                    v-if="currentIndex < totalQuestions - 1"
                    class="btn btn-primary"
                    @click="nextQuestion"
                  >
                    Next Question
                  </button>
                  <button
                    v-else
                    class="btn btn-outline-success"
                    @click="finish"
                  >
                    Finish Quiz
                  </button>
                </transition>
              </template>
            </QuestionCard>
          </transition>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue';
import QuestionCard from '@/components/QuestionCard.vue';
import {
  fetchQuizQuestions,
  fetchQuizQuestionByIndex,
  submitQuizAnswer,
  finishQuiz,
  updateCurrentQuestionIndex,
} from '@/api/quiz';
import type { Question, FinishQuizResponse } from '@/types';
import { useAuthStore } from '@/stores/auth';
import { useRouter } from 'vue-router';
import api from '@/api';
import { useQuizStore, type UserAnswerState } from '@/stores/quiz';
import { isAnswerCorrect } from '@/services/quizService';

const { logout } = useAuthStore();
const router = useRouter();
const quizStore = useQuizStore();
const auth = useAuthStore();

const currentQuestion = ref<Question | null>(null);
const currentIndex = ref(0);
const answered = ref(false);
const loading = ref(true);
const quizFinished = ref(false);
const score = ref<FinishQuizResponse | null>(null);
const totalQuestions = ref(0);
const selectedAnswers = ref<Record<number, number[]>>({});
const correctAnswerIds = ref<number[]>([]);

onMounted(async () => {
  if (!auth.user) {
    await auth.fetchUser();
    if (!auth.user) return router.push('/login');
  }

  // Validate state consistency before starting
  if (!quizStore.validateState()) {
    router.push('/exam-selection');
    return;
  }

  await api.get('/sanctum/csrf-cookie');
  await startQuiz();
});

const startQuiz = async () => {
  loading.value = true;
  try {
    const res = await fetchQuizQuestions(false); // Don't reset for normal start
    totalQuestions.value = res.question_count;
    currentIndex.value = res.current_index ?? 0;
    
    if (res.current_index !== undefined && !quizStore.isQuizStarted) {
      quizStore.startQuiz();
    }
    
    await loadQuestion(currentIndex.value);
  } catch (e: any) {
    if (e.response?.status === 404 || e.response?.status === 400) {
      quizStore.resetQuiz();
      router.push('/exam-selection');
      return;
    }
  } finally {
    loading.value = false;
  }
};

const loadQuestion = async (index: number) => {
  try {
    const res = await fetchQuizQuestionByIndex(index);
    currentQuestion.value = res.question;
    currentIndex.value = res.index;
    const saved: UserAnswerState | undefined = quizStore.userAnswers[res.question.id];
    if (saved) {
      selectedAnswers.value[res.question.id] = saved.answers;
      answered.value = true;
      correctAnswerIds.value = saved.correctAnswerIds;
    } else {
      answered.value = false;
      correctAnswerIds.value = [];
    }
  } catch (e) {
    // Error loading question
  }
};

const handleAnswer = async (answers: number[], setResult: (isCorrect: boolean) => void) => {
  const q = currentQuestion.value;
  if (!q) return;

  selectedAnswers.value[q.id] = answers;
  const res = await submitQuizAnswer({ question_id: q.id, answer_ids: answers });
  answered.value = true;
  correctAnswerIds.value = res.correct_answer_ids || [];
  const correct = isAnswerCorrect(answers, res.correct_answer_ids || []);
  quizStore.saveUserAnswer(q.id, {
    answers,
    isCorrect: correct,
    correctAnswerIds: res.correct_answer_ids || [],
  });
  setResult(correct);
};

const nextQuestion = async () => {
  if (currentIndex.value < totalQuestions.value - 1) {
    const newIndex = currentIndex.value + 1;
    await updateCurrentQuestionIndex(newIndex);
    await loadQuestion(newIndex);
    answered.value = false;
    correctAnswerIds.value = [];
  }
};

const finish = async () => {
  if (quizFinished.value) return;
  const res = await finishQuiz();
  score.value = res;
  quizFinished.value = true;
};

const resetQuiz = async () => {
  console.log('Starting quiz reset...');
  
  // Clear backend session first
  try {
    const clearResponse = await api.post('/quiz/clear');
    console.log('Backend session cleared:', clearResponse.data);
  } catch (e) {
    console.error('Error clearing backend session:', e);
  }
  
  // Store the current exam type before resetting
  const currentExamType = quizStore.selectedExamType;
  console.log('Current exam type:', currentExamType);
  
  // Reset frontend state with force reset to clear persisted data
  quizStore.forceResetQuiz();
  
  // Restore the exam type after reset
  if (currentExamType) {
    quizStore.setSelectedExamType(currentExamType);
    console.log('Exam type restored:', currentExamType);
  }
  
  // Reset local state
  quizFinished.value = false;
  answered.value = false;
  correctAnswerIds.value = [];
  currentIndex.value = 0;
  selectedAnswers.value = {};
  
  console.log('Starting new quiz with reset...');
  // Pass reset=true to force a new quiz session
  await startQuizWithReset();
};

const startQuizWithReset = async () => {
  loading.value = true;
  try {
    console.log('Fetching quiz questions with reset=true...');
    const res = await fetchQuizQuestions(true); // Pass reset=true
    console.log('Quiz questions response:', res);
    
    totalQuestions.value = res.question_count;
    currentIndex.value = res.current_index ?? 0;
    
    if (res.current_index !== undefined && !quizStore.isQuizStarted) {
      quizStore.startQuiz();
    }
    
    await loadQuestion(currentIndex.value);
  } catch (e: any) {
    console.error('Error starting quiz with reset:', e);
    if (e.response?.status === 404 || e.response?.status === 400) {
      quizStore.resetQuiz();
      router.push('/exam-selection');
      return;
    }
  } finally {
    loading.value = false;
  }
};

const abortTest = async () => {
  try {
    await api.post('/quiz/clear');
  } catch (e) {
    // Error clearing quiz session
  }
  
  quizStore.abortQuiz();
  router.push('/exam-selection');
};
</script>

<style scoped>
/* Estilos específicos de la página si los hay */
</style>