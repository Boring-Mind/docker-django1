#!/bin/sh

python3 manage.py migrate
gunicorn docker.wsgi:application --bind django:9090