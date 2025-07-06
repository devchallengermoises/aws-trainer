import { Question } from './Question';

export interface FetchQuestionResponse {
  expired: boolean;
  expires_in: number;
  index: number;
  question_count: number;
  question: Question;
}