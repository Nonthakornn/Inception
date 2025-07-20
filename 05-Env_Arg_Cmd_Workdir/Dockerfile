FROM python:3.12-alpine

ARG ENVIRONMENT=dev

ENV APP_ENVIRONMENT=${ENVIRONMENT}

WORKDIR /app

COPY requirements.txt requirements.txt

RUN pip install -r requirements.txt

# In /app directory
COPY app.py .

COPY templates ./templates/

RUN echo "Building env: ${APP_ENVIRONMENT}"

CMD ["python", "app.py"]