FROM python:3.10-slim

WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install -r requirements.txt gunicorn

# Copy project
COPY . .

# Collect static files
RUN python manage.py collectstatic --noinput

# Make port configurable via environment variable
ENV PORT=8000

# Expose the port
EXPOSE \$PORT

# Run gunicorn
CMD gunicorn mcp_nexus.wsgi:application --bind 0.0.0.0:\$PORT