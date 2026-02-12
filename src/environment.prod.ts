export const enviroment = {
  production: true,
  apiURL: (window as any)._env?.apiUrl || 'http://backend:8000/api'
};
