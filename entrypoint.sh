#!/bin/sh

python3 manage.py migrate
# Change binded ip on every change
gunicorn docker.wsgi:application --bind 172.18.0.14:9090

# python3 manage.py runserver 0.0.0.0:8000