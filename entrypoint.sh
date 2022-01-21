#!/bin/sh

echo "---------Apply Migration---------"
python manage.py makemigrations
pyhton manage.py migrate --no-input

echo "---------Collect-Statics---------"
python manage.py collectstatic --no-input

echo "---------Run-Gunicorn------------"
gunicorn django_project.wsgi:application --bind 0.0.0.0:8000
