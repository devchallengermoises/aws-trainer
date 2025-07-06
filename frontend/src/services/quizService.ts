export function isAnswerCorrect(userAnswers: number[], correctAnswers: number[]): boolean {
  if (userAnswers.length !== correctAnswers.length) return false;
  const sortedUser = [...userAnswers].sort();
  const sortedCorrect = [...correctAnswers].sort();
  return sortedUser.every((val, idx) => val === sortedCorrect[idx]);
}

export function getUnansweredQuestionIds(allQuestionIds: number[], userAnswers: Record<number, any>): number[] {
  return allQuestionIds.filter(id => !userAnswers[id]);
}

export function resetQuizState() {
  return {
    userAnswers: {},
    isQuizStarted: false,
    selectedExamType: null,
  };
} 