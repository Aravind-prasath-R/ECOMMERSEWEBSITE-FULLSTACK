# Deployment Guide

## Option 1: GitHub Pages (Frontend Only)
1. Enable GitHub Pages in repository settings
2. Select "GitHub Actions" as deployment source
3. Site: https://aravind-prasath-r.github.io/ECOMMERSEWEBSITE-FULLSTACK

## Option 2: Vercel (Full-stack)
1. Install Vercel CLI: `npm i -g vercel`
2. Run `vercel` in project root
3. Follow prompts to connect GitHub
4. Automatic deployment on git push

## Option 3: Traditional Hosting

### Frontend Deployment
```bash
cd frontend/app
npm run build
# Upload build/ folder to web server
```

### Backend Deployment (Django)
1. Server setup:
```bash
# Navigate to backend directory
cd backend/ecommerce/project

# Install dependencies
pip install -r ../../requirements.txt
pip install gunicorn

# Collect static files
python manage.py collectstatic

# Run with Gunicorn
gunicorn project.wsgi:application --bind 0.0.0.0:8000
```

2. Use Nginx + Gunicorn for production
3. Configure PostgreSQL/MySQL database
4. Set environment variables for production

## Environment Variables
Create `.env` file:
```
DEBUG=False
SECRET_KEY=your-secret-key
DATABASE_URL=your-database-url
ALLOWED_HOSTS=yourdomain.com
```

## Domain Configuration
- Update DNS settings to point to hosting provider
- Configure SSL certificates
- Update ALLOWED_HOSTS in Django settings
