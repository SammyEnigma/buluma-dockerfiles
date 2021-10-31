# syntax=docker/dockerfile:1
FROM ubuntu:20.04
COPY . /app
RUN make /app
CMD python /app/app.py