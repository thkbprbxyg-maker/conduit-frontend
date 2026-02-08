xport const environment = {
  production: false,
  apiURL: (window as any).__env?.apiUrl || 'http://localhost:8000/api'
}; 
