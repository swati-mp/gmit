FROM python:3.10.6-slim
LABEL maintainer="Swati"
ENV PYTHONUNBUFFERED 1

COPY ./requirements_docker.txt requirements_docker.txt
COPY ./webapp /webapp
COPY ./models/models.joblib/models.joblib models/models.joblib/models.joblib

WORKDIR /webapp
EXPOSE 8000

RUN python -m venv /py && \
    /py/bin/pip install --upgrade pip && \
    /py/bin/pip install -r /requirements_docker.txt && \
    adduser --disabled-password --no-create-home webapp

ENV PATH="/py/bin:$PATH"

USER webapp