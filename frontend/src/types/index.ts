// Quiz domain
export interface Question {
  id: number;
  question: string;
  exam_type_id: number;
  answers: Answer[];
}

export interface Answer {
  id: number;
  answer_text: string;
  is_correct: boolean;
}

// API responses
export interface QuizResponse {
  question_count: number;
  current_index: number;
}

export interface FetchQuestionResponse {
  question: Question;
  index: number;
  question_count: number;
}

export interface SubmitAnswerResponse {
  isCorrect: boolean;
}

export interface FinishQuizResponse {
  correct_answers: number;
  total_questions: number;
  score_percent: number;
}

// API payloads
export interface SubmitAnswerPayload {
  question_id: number;
  answer_ids: number[];
}

// User domain
export interface User {
  id: number;
  name: string;
  email: string;
}

export interface ExamType {
  id: number;
  name: string;
  code: string;
  description: string;
}

export * from './Question';
export * from './Answer';
export * from './QuizResponse';
export * from './FetchQuestionResponse';
export * from './SubmitAnswerPayload';
export * from './SubmitAnswerResponse';
export * from './FinishQuizResponse';