ARG PYTHON_VERSION=3.10-slim-buster

FROM python:${PYTHON_VERSION}

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1


WORKDIR /app

COPY requirements.txt ./requirements.txt

RUN set -ex && \
    pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt
    rm -rf /root/.cache/

COPY . /app/

#RUN ["python", "manage.py", "collectstatic", "--noinput"]

EXPOSE 8000

# replace demo.wsgi with <project_name>.wsgi
CMD ["gunicorn", "--bind", ":8000", "--workers", "2", "pypro.wsgi"]
