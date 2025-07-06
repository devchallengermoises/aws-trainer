<template>
  <div class="min-vh-100 bg-light py-5 px-3">
    <div class="container">
      <transition name="fade-slide" mode="out-in">
        <div v-if="!loading" key="exam-card" class="mx-auto bg-white shadow-sm rounded-3 p-5 position-relative" style="max-width: 1200px;">
          <button class="btn btn-outline-danger position-absolute top-0 end-0 m-3" @click="logout">Logout</button>
          <div class="text-center mb-4">
            <h2>Select Your Exam</h2>
            <p class="text-muted">Choose the AWS certification exam you want to practice</p>
          </div>

          <div v-if="filteredExamTypes.length === 0" class="text-center text-muted">
            <p>No exams available at the moment.</p>
          </div>
          <div v-else class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4 justify-content-center">
            <div v-for="examType in filteredExamTypes" :key="examType.id" class="col d-flex align-items-stretch">
              <div class="card h-100 w-100">
                <div class="card-body d-flex flex-column justify-content-between">
                  <div>
                    <h5 class="card-title">{{ examType.name }}</h5>
                    <p class="card-text text-muted">{{ examType.description }}</p>
                  </div>
                  <button 
                    class="btn btn-primary w-100 mt-3"
                    @click="selectExam(examType)"
                  >
                    Start Practice
                  </button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </transition>
      <div v-if="loading" class="mx-auto bg-white shadow-sm rounded-3 p-5 position-relative text-center" style="max-width: 1200px;">
        <div class="spinner-border text-primary" role="status">
          <span class="visually-hidden">Loading...</span>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, computed, onMounted } from 'vue';
import { useRouter } from 'vue-router';
import { useQuizStore } from '@/stores/quiz';
import { useAuthStore } from '@/stores/auth';
import type { ExamType } from '@/types';
import { fetchExamTypes } from '@/api/exam';
import api from '@/api';

const router = useRouter();
const quizStore = useQuizStore();
const authStore = useAuthStore();

const loading = ref(true);
const examTypes = ref<ExamType[]>([]);


const filteredExamTypes = computed(() => examTypes.value);

onMounted(async () => {
  try {
    examTypes.value = await fetchExamTypes();
  } catch (error) {
    console.error('Error fetching exam types:', error);
  } finally {
    loading.value = false;
  }
});

const selectExam = async (examType: ExamType) => {
  await api.get('/sanctum/csrf-cookie');
  quizStore.setSelectedExamType(examType);
  quizStore.startQuiz();
  router.push('/quiz');
};

const logout = () => {
  authStore.logout();
};
</script>

<style scoped>
.fade-slide-enter-active, .fade-slide-leave-active {
  transition: all 0.3s cubic-bezier(.4,0,.2,1);
}
.fade-slide-enter-from {
  opacity: 0;
  transform: translateY(20px);
}
.fade-slide-leave-to {
  opacity: 0;
  transform: translateY(-20px);
}
</style> 