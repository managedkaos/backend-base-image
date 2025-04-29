# Stage 1: Base build stage
FROM python:3.9-slim AS builder

# Set environment variables to optimize Python
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Install system dependencies and required tools
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    git \
    curl \
    libgl1-mesa-glx \
    libglib2.0-0 \
    libsm6 \
    libxrender1 \
    libxext6 \
    inotify-tools \
    procps \
    libmagic1 \
    ffmpeg \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip and install dependencies
RUN pip install --upgrade pip

# Copy the requirements file first (better caching)
COPY requirements.txt /etc/requirements.txt

# Install Python dependencies
RUN pip install --no-cache-dir --requirement /etc/requirements.txt
