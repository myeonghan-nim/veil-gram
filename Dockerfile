FROM python:3.12-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY core ./core/
COPY veilgram ./veilgram/
COPY manage.py .

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
