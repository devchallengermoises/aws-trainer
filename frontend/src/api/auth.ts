import api from './index';

export const login = async ({ email, password }: { email: string; password: string }) => {
  await api.get('/sanctum/csrf-cookie');
  return api.post('/login', { email, password });
};

export const logout = async () => api.post('/logout');

export const getUser = async () => {
  try {
    return await api.get('/user');
  } catch {
    return { data: null };
  }
};

export const clearQuiz = async () => {
  return api.post('/quiz/clear');
};