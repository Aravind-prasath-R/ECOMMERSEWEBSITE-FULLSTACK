# Frontend Dockerfile
FROM node:18-alpine as frontend-build
WORKDIR /app/frontend
COPY frontend/app/package*.json ./
RUN npm ci
COPY frontend/app/ .
RUN npm run build

# Backend Dockerfile
FROM python:3.9-slim
WORKDIR /app
COPY backend/requirements.txt .
RUN pip install -r requirements.txt
COPY backend/ .
COPY --from=frontend-build /app/frontend/app/build ./static/

EXPOSE 8000
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "project.wsgi:application"]
