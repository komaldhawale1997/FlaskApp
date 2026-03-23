FROM python:3.7 AS builder

WORKDIR /app

COPY . .

RUN pip install -r requirements.txt --target=/app

FROM gcr.io/distroless/python3

WORKDIR /app

COPY --from=builder /app .

EXPOSE 5000

CMD ["app.py"]
