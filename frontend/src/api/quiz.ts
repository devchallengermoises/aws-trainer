import api from './index';
import type {
  QuizResponse,
  SubmitAnswerPayload,
  SubmitAnswerResponse,
  FinishQuizResponse,
  FetchQuestionResponse,
  Question,
} from '@/types';
import { useQuizStore } from '@/stores/quiz';

export const fetchQuizQuestions = async (reset = false): Promise<QuizResponse> => {
  const quizStore = useQuizStore();
  const response = await api.post('/quiz/start', {
    exam_type_code: quizStore.selectedExamType?.code,
    reset
  });
  return response.data;
};

export const fetchQuizQuestionByIndex = async (
  index: number
): Promise<FetchQuestionResponse> => {
  const response = await api.get(`/quiz/question/${index}`);
  return response.data;
};

export const submitQuizAnswer = async (data: { question_id: number; answer_ids: number[] }) => {
  const response = await api.post('/quiz/answer', data);
  return response.data;
};

export const finishQuiz = async (): Promise<FinishQuizResponse> => {
  const response = await api.post('/quiz/finish');
  return response.data;
};

export const updateCurrentQuestionIndex = async (index: number) => {
  const response = await api.post('/quiz/current-index', { index });
  return response.data;
};