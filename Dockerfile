FROM python:3.12-slim

ENV PYTHONUNBUFFERED=1

RUN apt-get update && apt-get install -y \
    libpq-dev \
    gcc \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY core ./core/
COPY veilgram ./veilgram/
COPY entrypoint.sh .
COPY manage.py .

RUN chmod +x entrypoint.sh
ENTRYPOINT ["./entrypoint.sh"]
