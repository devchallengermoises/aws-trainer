<template>
  <div class="d-flex align-items-center justify-content-center min-vh-100 bg-light">
    <div class="card p-4 shadow" style="width: 100%; max-width: 400px;">
      <h2 class="text-center mb-4">Login</h2>

      <form @submit.prevent="handleLogin">
        <div class="mb-3">
          <label for="email" class="form-label">Email</label>
          <div class="input-group">
            <span class="input-group-text">
              <i class="bi bi-envelope"></i>
            </span>
            <input 
              v-model="form.email" 
              type="email" 
              class="form-control" 
              :class="{ 'is-invalid': hasFieldError('email') || emailError }"
              id="email" 
              placeholder="your@email.com"
              required 
              @input="clearFieldError('email')"
              @blur="validateEmail"
            />
          </div>
          <div v-if="hasFieldError('email')" class="invalid-feedback d-block">
            <i class="bi bi-exclamation-circle me-1"></i>
            {{ getFieldError('email') }}
          </div>
          <div v-else-if="emailError" class="invalid-feedback d-block">
            <i class="bi bi-exclamation-circle me-1"></i>
            {{ emailError }}
          </div>
        </div>

        <div class="mb-3">
          <label for="password" class="form-label">Password</label>
          <div class="input-group">
            <span class="input-group-text">
              <i class="bi bi-lock"></i>
            </span>
            <input 
              v-model="form.password" 
              type="password" 
              class="form-control" 
              :class="{ 'is-invalid': hasFieldError('password') || passwordError }"
              id="password" 
              placeholder="Your password"
              required 
              @input="clearFieldError('password')"
              @blur="validatePassword"
            />
          </div>
          <div v-if="hasFieldError('password')" class="invalid-feedback d-block">
            <i class="bi bi-exclamation-circle me-1"></i>
            {{ getFieldError('password') }}
          </div>
          <div v-else-if="passwordError" class="invalid-feedback d-block">
            <i class="bi bi-exclamation-circle me-1"></i>
            {{ passwordError }}
          </div>
        </div>

        <button type="submit" class="btn btn-primary w-100" :disabled="loading || !isFormValid">
          <span v-if="loading" class="spinner-border spinner-border-sm me-2"></span>
          <i v-else class="bi bi-box-arrow-in-right me-2"></i>
          {{ loading ? 'Signing in...' : 'Sign In' }}
        </button>

        <div v-if="auth.error" class="alert alert-danger mt-3">
          <i class="bi bi-exclamation-triangle me-2"></i>
          {{ auth.error }}
        </div>

        <div v-if="auth.fieldErrors && Object.keys(auth.fieldErrors).length > 0" class="alert alert-warning mt-3">
          <i class="bi bi-info-circle me-2"></i>
          Please correct the errors in the form.
        </div>
      </form>
    </div>
  </div>
</template>

<script setup lang="ts">
import { reactive, ref, computed, onMounted } from 'vue'
import { useAuthStore } from '@/stores/auth'

const auth = useAuthStore()
const loading = ref(false)
const emailError = ref<string | null>(null)
const passwordError = ref<string | null>(null)

const form = reactive({
  email: '',
  password: ''
})

onMounted(() => {
  auth.clearErrors && auth.clearErrors();
})

const isFormValid = computed(() => {
  return form.email.trim() !== '' && 
         form.password.trim() !== '' && 
         !emailError.value && 
         !passwordError.value
})

const hasFieldError = (field: string) => {
  return auth.fieldErrors[field] && auth.fieldErrors[field].length > 0
}

const getFieldError = (field: string) => {
  return auth.fieldErrors[field]?.[0] || ''
}

const clearFieldError = (field: string) => {
  if (auth.fieldErrors[field]) {
    delete auth.fieldErrors[field]
  }
  if (field === 'email') {
    emailError.value = null
  } else if (field === 'password') {
    passwordError.value = null
  }
}

const validateEmail = () => {
  emailError.value = null
  if (!form.email.trim()) {
    emailError.value = 'Email is required'
  } else if (!isValidEmail(form.email)) {
    emailError.value = 'Please enter a valid email address'
  }
}

const validatePassword = () => {
  passwordError.value = null
  if (!form.password.trim()) {
    passwordError.value = 'Password is required'
  } else if (form.password.length < 6) {
    passwordError.value = 'Password must be at least 6 characters'
  }
}

const isValidEmail = (email: string) => {
  const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/
  return emailRegex.test(email)
}

const handleLogin = async () => {
  // Validate before submitting
  validateEmail()
  validatePassword()
  
  if (!isFormValid.value) {
    return
  }

  loading.value = true

  try {
    await auth.login(form)
  } catch (err: any) {
    // Errors are already handled in the store
    console.error('Login error:', err)
  } finally {
    loading.value = false
  }
}
</script>

<style scoped>
.alert {
  font-size: 0.9rem;
}

.invalid-feedback {
  display: block;
  font-size: 0.875rem;
  margin-top: 0.25rem;
}

.form-control.is-invalid {
  border-color: #dc3545;
  box-shadow: 0 0 0 0.2rem rgba(220, 53, 69, 0.25);
}

.input-group-text {
  background-color: #f8f9fa;
  border-color: #ced4da;
}

.card {
  border: none;
  box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.15);
}

.btn-primary {
  background-color: #0d6efd;
  border-color: #0d6efd;
  transition: all 0.2s ease-in-out;
}

.btn-primary:hover {
  background-color: #0b5ed7;
  border-color: #0a58ca;
  transform: translateY(-1px);
}

.btn-primary:disabled {
  background-color: #6c757d;
  border-color: #6c757d;
  transform: none;
}
</style>