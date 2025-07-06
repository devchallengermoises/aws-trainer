<template>
  <div class="d-flex align-items-center justify-content-center min-vh-100 bg-light">
    <div class="card p-4 shadow" style="width: 100%; max-width: 400px;">
      <h2 class="text-center mb-4">Login</h2>

      <form @submit.prevent="handleLogin">
        <div class="mb-3">
          <label for="email" class="form-label">Email</label>
          <input v-model="form.email" type="email" class="form-control" id="email" required />
        </div>

        <div class="mb-3">
          <label for="password" class="form-label">Password</label>
          <input v-model="form.password" type="password" class="form-control" id="password" required />
        </div>

        <button type="submit" class="btn btn-primary w-100" :disabled="loading">
          <span v-if="loading" class="spinner-border spinner-border-sm me-2"></span>
          Login
        </button>

        <p v-if="error" class="text-danger mt-3 text-center">{{ error }}</p>
      </form>
    </div>
  </div>
</template>

<script setup lang="ts">
import { reactive, ref } from 'vue'
import { useAuthStore } from '@/stores/auth'

const auth = useAuthStore()
const loading = ref(false)
const error = ref<string | null>(null)

const form = reactive({
  email: '',
  password: ''
})

const handleLogin = async () => {
  error.value = null
  loading.value = true

  try {
    await auth.login(form)
  } catch (err: any) {
    error.value = err?.response?.data?.message || 'Login failed'
  } finally {
    loading.value = false
  }
}
</script>