<template>
  <div class="d-flex flex-column gap-4">
    <h5 class="fw-semibold">
      {{ questionNumber }}) {{ question.question }}
    </h5>

    <div
      v-for="(answer, idx) in answers"
      :key="answer.id"
      class="form-check"
      :class="{
        'border border-success bg-success bg-opacity-25 rounded': hasUserAnswered && isSelectedCorrect(answer.id),
        'border border-danger bg-danger bg-opacity-25 rounded': hasUserAnswered && isSelectedIncorrect(answer.id),
        'border border-success border-2': hasUserAnswered && isUnselectedCorrect(answer.id)
      }"
    >
      <transition name="fade-highlight">
        <input
          v-if="isMultiple"
          class="form-check-input"
          type="checkbox"
          :id="'answer-' + answer.id"
          :value="answer.id"
          v-model="selectedAnswers"
          :disabled="hasUserAnswered || (selectedAnswers.length >= maxSelectable && !selectedAnswers.includes(answer.id))"
        />
        <input
          v-else
          class="form-check-input"
          type="radio"
          :id="'answer-' + answer.id"
          :value="answer.id"
          v-model="selectedAnswer"
          :disabled="hasUserAnswered"
        />
      </transition>
      <label class="form-check-label ms-2" :for="'answer-' + answer.id">
        <strong>{{ String.fromCharCode(65 + idx) }}.</strong>
        <span v-text="answer.answer_text" />
      </label>
    </div>

    <div class="text-center mt-3">
      <transition name="fade-scale" mode="out-in">
        <button
          v-if="!hasUserAnswered"
          key="submit"
          class="btn btn-primary"
          @click="checkAnswer"
          :disabled="!canSubmit"
        >
          Submit
        </button>
        <div v-else class="d-flex flex-column align-items-center gap-3">
          <transition name="bounce">
            <div class="feedback-message" :class="isAnswerCorrect ? 'text-success' : 'text-danger'">
              {{ resultMessage }}
            </div>
          </transition>
          <slot name="next-button"></slot>
        </div>
      </transition>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, computed, watch } from 'vue';
import type { Question } from '@/types/Question';

const props = defineProps<{
  question: Question;
  questionNumber: number;
  totalQuestions: number;
  savedState?: {
    answers: number[];
    isCorrect: boolean;
    correctAnswerIds?: number[];
  };
  highlightCorrect?: number[];
}>();

const emit = defineEmits(['answered']);

const selectedAnswer = ref<number | null>(null);
const selectedAnswers = ref<number[]>([]);
const hasUserAnswered = ref(false);
const isAnswerCorrect = ref(false);
const answers = ref([...props.question.answers]);

const isMultiple = computed(() => props.question.is_multiple_choice);
const maxSelectable = computed(() => props.question.max_selectable ?? 1);

const isSelected = (id: number) =>
  isMultiple.value ? selectedAnswers.value.includes(id) : selectedAnswer.value === id;

const canSubmit = computed(() =>
  isMultiple.value ? selectedAnswers.value.length > 0 : selectedAnswer.value !== null
);

watch(
  () => props.question.id,
  () => {
    if (props.savedState) {
      if (isMultiple.value) {
        selectedAnswers.value = [...props.savedState.answers];
      } else {
        selectedAnswer.value = props.savedState.answers[0] ?? null;
      }
      hasUserAnswered.value = true;
      isAnswerCorrect.value = props.savedState.isCorrect;
    } else {
      selectedAnswer.value = null;
      selectedAnswers.value = [];
      hasUserAnswered.value = false;
      isAnswerCorrect.value = false;
    }
    answers.value = [...props.question.answers];
  },
  { immediate: true }
);

const resultMessage = computed(() =>
  isAnswerCorrect.value ? '✅ Correct!' : '❌ Incorrect!'
);

const checkAnswer = () => {
  const selected = isMultiple.value
    ? [...selectedAnswers.value].sort()
    : selectedAnswer.value !== null
    ? [selectedAnswer.value]
    : [];

  emit('answered', selected, (isCorrect: boolean) => {
    isAnswerCorrect.value = isCorrect;
    hasUserAnswered.value = true;
  });
};

const isCorrectAnswer = (id: number) => {
  return Array.isArray(props.highlightCorrect) && props.highlightCorrect.includes(id);
};
const isSelectedCorrect = (id: number) => {
  return hasUserAnswered.value && isSelected(id) && isCorrectAnswer(id);
};
const isSelectedIncorrect = (id: number) => {
  return hasUserAnswered.value && isSelected(id) && !isCorrectAnswer(id);
};
const isUnselectedCorrect = (id: number) => {
  return hasUserAnswered.value && !isSelected(id) && isCorrectAnswer(id);
};
</script>

<style scoped>
input[type='checkbox'],
input[type='radio'] {
  cursor: pointer;
}

.fade-highlight-enter-active, .fade-highlight-leave-active {
  transition: background-color 0.3s, border-color 0.3s;
}

.fade-highlight-enter-from, .fade-highlight-leave-to {
  background-color: transparent;
  border-color: #dee2e6;
}

.fade-scale-enter-active,
.fade-scale-leave-active {
  transition: all 0.3s ease;
}

.fade-scale-enter-from,
.fade-scale-leave-to {
  opacity: 0;
  transform: scale(0.9);
}

.bounce-enter-active {
  animation: bounce-in 0.5s;
}

.bounce-leave-active {
  animation: bounce-in 0.5s reverse;
}

@keyframes bounce-in {
  0% {
    transform: scale(0);
  }
  50% {
    transform: scale(1.25);
  }
  100% {
    transform: scale(1);
  }
}

.feedback-message {
  font-size: 1.2rem;
  font-weight: 500;
}
</style>