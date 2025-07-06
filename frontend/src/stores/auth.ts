import { defineStore } from 'pinia';
import router from '@/router';
import * as authApi from '@/api/auth';

export const useAuthStore = defineStore('auth', {
  state: () => ({
    user: null as Record<string, any> | null,
    error: null as string | null,
    loading: false,
  }),

  actions: {
    async login(credentials: { email: string; password: string }) {
      this.clearError();
      this.loading = true;

      try {
        await authApi.login(credentials);
        await this.fetchUser();
        await router.push('/exam-selection');
      } catch (err: any) {
        this.error = err?.response?.data?.message || 'Login failed';
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
        console.warn('Logout failed silently');
      } finally {
        this.user = null;
        router.push('/login');
      }
    },
    

    clearError() {
      this.error = null;
    },
  },

  persist: true,
});
