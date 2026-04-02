# Use a slim Python image
FROM python:3.11-slim

# Install dependencies for Pillow
RUN apt-get update && apt-get install -y \
    libjpeg-dev \
    zlib1g-dev \
    libfreetype6-dev \
    && rm -rf /var/lib/apt/lists/*

# Set working directory and install requirements
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of your code
COPY . .

# Replace with your actual start command (e.g., gunicorn)
CMD ["gunicorn", "project.wsgi:application"]
