FROM debian:sid-slim
LABEL maintainer "Michael Buluma <ops@buluma.co.ke>"

RUN apt-get update && apt-get install -y \
	netcat \
	--no-install-recommends \
	&& rm -rf /var/lib/apt/lists/*

ENTRYPOINT [ "netcat" ]
