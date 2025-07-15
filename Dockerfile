FROM python:3.11-slim

LABEL org.opencontainers.image.source="https://github.com/Mahin07m/flaskapp_todo"

RUN apt-get update

WORKDIR /app

COPY . .

RUN pip install --no-cache-dir -r requirements

EXPOSE 5000

CMD ["python", "app.py"]

