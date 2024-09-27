FROM python:3.12
WORKDIR /app
COPY requirements.txt .
RUN python -m venv /venv
ENV PATH="/venv/bin:$PATH"
RUN pip install --upgrade pip && \
    pip install -r requirements.txt

COPY . .

ENV PORT=80

CMD ["gunicorn", "--bind", ":$PORT", "--workers", "1", "--threads", "8", "main:app"]