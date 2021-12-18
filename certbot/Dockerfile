FROM buluma/alpine:3.15
LABEL maintainer "Michael Buluma <buluma@buluma.co.ke>"

ENV TZ 'Afria/Nairobi'

ENV TZ ${TZ}

RUN apk --no-cache add \
	bash \
	certbot

ENTRYPOINT [ "certbot" ]
