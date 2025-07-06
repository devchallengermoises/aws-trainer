import type { Answer } from './Answer';


export interface Question {
  id: number;
  question: string;
  is_multiple_choice?: boolean;
  max_selectable?: number;
  answers: Answer[];
}