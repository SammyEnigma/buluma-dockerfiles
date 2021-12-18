# FROM debian:bullseye-slim
FROM buluma/traceroute:1.01
LABEL maintainer "Michael Buluma <ops@buluma.co.ke>"

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y apt-utils \
	traceroute \
	--no-install-recommends \
	&& rm -rf /var/lib/apt/lists/*

ENTRYPOINT [ "traceroute" ]
