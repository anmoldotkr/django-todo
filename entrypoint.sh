#!/bin/bash

set -e  # Exit the script if any command fails

# Set DJANGO_SETTINGS_MODULE environment variable
export DJANGO_SETTINGS_MODULE=todoApp.settings

# Apply database migrations
echo "Applying database migrations..."
python manage.py makemigrations
python manage.py migrate

# Create superuser if not already exists
echo "Creating superuser..."
python -c "
import os
import django
from django.core.management import call_command
from django.contrib.auth import get_user_model

# Configure settings
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'todoApp.settings')
django.setup()

User = get_user_model()
username = 'vikas'
email = 'vikas123@gmail.com'
password = 'vikas@123'

# Check if superuser already exists
if not User.objects.filter(username=username).exists():
    # Create user
    User.objects.create_superuser(username=username, email=email, password=password)
    print('Superuser created successfully.')
else:
    print('Superuser already exists or failed to create.')
"

# Execute the CMD from the Dockerfile
exec "$@"
