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
  };

  const saveUserAnswer = (questionId: number, state: UserAnswerState) => {
    userAnswers.value[questionId] = state;
  };

  const abortQuiz = () => {
    resetQuiz();
  };

  return {
    selectedExamType,
    isQuizStarted,
    userAnswers,
    setSelectedExamType,
    startQuiz,
    resetQuiz,
    saveUserAnswer,
    abortQuiz,
  };
}, {
  persist: true
}); 