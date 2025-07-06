import api from './index';
import type { ExamType } from '@/types';

export const fetchExamTypes = async (): Promise<ExamType[]> => {
  const response = await api.get('/exam-types');
  return response.data;
}; 