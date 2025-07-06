import axios from 'axios';
import router from '@/router'; 
import { useAuthStore } from '@/stores/auth';

const api = axios.create({
  baseURL: import.meta.env.VITE_API_BASE_URL || 'http://localhost:8000/api',
  withCredentials: true,
  headers: {
    'Content-Type': 'application/json',
    'X-Requested-With': 'XMLHttpRequest',
  },
});

api.interceptors.request.use(config => {
  const matches = document.cookie.match(new RegExp('XSRF-TOKEN=([^;]+)'));
  if (matches) {
    config.headers['X-XSRF-TOKEN'] = decodeURIComponent(matches[1]);
  }
  return config;
});

api.interceptors.response.use(
  response => response,
  error => {
    if (error.response?.status === 401) {
      const auth = useAuthStore();
      auth.user = null;
      router.push('/login');
    }
    return Promise.reject(error);
  }
);

export default api;