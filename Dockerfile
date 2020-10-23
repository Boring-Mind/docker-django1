# slim buster is 8 times smaller image of the python 3.8
FROM python:3.8-slim-buster

WORKDIR /usr/src/app

# Installing python dependencies
RUN pip install -U pip wheel pipenv
RUN pipenv --python 3.8

# Installing project dependencies
COPY Pipfile* ./
RUN pipenv install --system --deploy
CMD pipenv shell

COPY . /usr/src/app

EXPOSE 8000

# Security needs - run container under it's own user, not a root
# Fix an issue where users cannot migrate
RUN useradd --create-home appuser
USER appuser

ENTRYPOINT ["sh", "entrypoint.sh"]