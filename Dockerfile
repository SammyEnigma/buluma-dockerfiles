# syntax=docker/dockerfile:1
FROM buluma/ubuntu:20.04
COPY . /app
# RUN make /app
# CMD python /app/app.py
RUN ls -a /app

RUN mkdir /target && mkdir /backup
ENV PREFIX backup

RUN /app/command.sh