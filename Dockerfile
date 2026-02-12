# ---- Build stage ----
FROM node:20-alpine AS build
WORKDIR /app

COPY package*.json ./
RUN npm ci

COPY . .

# ✅ Inject API URL at build-time (no hardcoded IP in repo)
ARG API_URL=http://<your_server_ip>:8000/api
RUN sed -i "s|http://<your_server_ip>:8000/api|${API_URL}|g" src/environments/environment.prod.ts

RUN npm run build

# ---- Runtime stage ----
FROM nginx:alpine
COPY --from=build /app/dist /usr/share/nginx/htmll
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
