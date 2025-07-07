import { defineStore } from 'pinia';
import router from '@/router';
import * as authApi from '@/api/auth';

export const useAuthStore = defineStore('auth', {
  state: () => ({
    user: null as Record<string, any> | null,
    error: null as string | null,
    fieldErrors: {} as Record<string, string>,
    loading: false,
  }),

  actions: {
    async login(credentials: { email: string; password: string }) {
      this.clearErrors();
      this.loading = true;

      try {
        await authApi.login(credentials);
        await this.fetchUser();
        await router.push('/exam-selection');
      } catch (err: any) {
        const status = err?.response?.status;
        const message = err?.response?.data?.message;
        
        // Handle different types of errors
        if (status === 401) {
          this.error = 'Invalid credentials. Please check your email and password.';
        } else if (status === 422) {
          // Validation errors
          const errors = err?.response?.data?.errors;
          if (errors) {
            this.fieldErrors = errors;
            this.error = 'Please correct the errors in the form.';
          } else {
            this.error = message || 'Validation error';
          }
        } else if (status === 429) {
          this.error = 'Too many login attempts. Please wait a moment before trying again.';
        } else if (status >= 500) {
          this.error = 'Server error. Please try again later.';
        } else {
          this.error = message || 'Unexpected error during login';
        }
      } finally {
        this.loading = false;
      }
    },

    async fetchUser(): Promise<boolean> {
      try {
        const { data } = await authApi.getUser();
        if (data) {
          this.user = data;
          return true;
        } else {
          this.user = null;
          return false;
        }
      } catch {
        this.user = null;
        return false;
      }
    },

    async logout() {
      try {
        await authApi.clearQuiz();
        await authApi.logout();
      } catch (e) {
        // Sign out failed silently
      } finally {
        this.user = null;
        router.push('/login');
      }
    },
    
    clearErrors() {
      this.error = null;
      this.fieldErrors = {};
    },

    clearError() {
      this.error = null;
    },
  },

  persist: true,
});
