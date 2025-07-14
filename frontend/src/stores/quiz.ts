import { defineStore } from 'pinia';
import { ref } from 'vue';
import type { ExamType } from '@/types';
import { resetQuizState } from '@/services/quizService';

export type UserAnswerState = {
  answers: number[];
  isCorrect: boolean;
  correctAnswerIds: number[];
};

export const useQuizStore = defineStore('quiz', () => {
  const selectedExamType = ref<ExamType | null>(null);
  const isQuizStarted = ref(false);
  const userAnswers = ref<Record<number, UserAnswerState>>({});

  const setSelectedExamType = (examType: ExamType) => {
    selectedExamType.value = examType;
  };

  const startQuiz = () => {
    isQuizStarted.value = true;
    userAnswers.value = {};
  };

  const resetQuiz = () => {
    const state = resetQuizState();
    selectedExamType.value = state.selectedExamType;
    isQuizStarted.value = state.isQuizStarted;
    userAnswers.value = state.userAnswers;
    
    // Force clear persisted state by triggering a reactive update
    // This ensures localStorage is also cleared when persist: true is used
    userAnswers.value = { ...userAnswers.value };
  };

  const forceResetQuiz = () => {
    // This method forces a complete reset including persisted state
    const state = resetQuizState();
    selectedExamType.value = state.selectedExamType;
    isQuizStarted.value = state.isQuizStarted;
    userAnswers.value = state.userAnswers;
    
    // Force clear persisted state
    userAnswers.value = { ...userAnswers.value };
    
    // Clear localStorage manually if needed
    if (typeof window !== 'undefined' && window.localStorage) {
      const keys = Object.keys(window.localStorage);
      keys.forEach(key => {
        if (key.includes('quiz')) {
          window.localStorage.removeItem(key);
        }
      });
    }
  };

  const saveUserAnswer = (questionId: number, state: UserAnswerState) => {
    userAnswers.value[questionId] = state;
  };

  const abortQuiz = () => {
    resetQuiz();
  };

  // New method to validate state consistency
  const validateState = () => {
    // If quiz is started but no exam type is selected, reset
    if (isQuizStarted.value && !selectedExamType.value) {
      resetQuiz();
      return false;
    }
    return true;
  };

  // New method to sync with backend state
  const syncWithBackend = async () => {
    try {
      const response = await fetch('/api/quiz/validate-session', {
        method: 'GET',
        credentials: 'include'
      });
      const data = await response.json();
      
      if (!data.valid && isQuizStarted.value) {
        resetQuiz();
        return false;
      }
      return data.valid;
    } catch (e) {
      if (isQuizStarted.value) {
        resetQuiz();
      }
      return false;
    }
  };

  return {
    selectedExamType,
    isQuizStarted,
    userAnswers,
    setSelectedExamType,
    startQuiz,
    resetQuiz,
    forceResetQuiz,
    saveUserAnswer,
    abortQuiz,
    validateState,
    syncWithBackend,
  };
}, {
  persist: true
}); 