# FROM python:3.6.10-alpine3.11
FROM python:3.9.7-alpine3.14

LABEL maintainer "Michael Buluma <ops@buluma.co.ke>"

ENV VERSION v0.2.4
ENV SOURCE_DIR /usr/local/elastalert
ENV CONFIG_DIR /etc/elastalert
ENV DOWNLOAD_URL https://github.com/Yelp/elastalert/archive/${VERSION}.tar.gz
ENV CRYPTOGRAPHY_DONT_BUILD_RUST=1

RUN set -ex \
    && apk upgrade \
    && apk add sudo bash wget curl ca-certificates tzdata openssl libmagic \
    # && apk add --virtual .build-deps tar openssl-dev libffi-dev gcc musl-dev \
    && sudo apk add --virtual .build-deps tar gcc musl-dev python3-dev libffi-dev openssl-dev cargo \
    # && curl https://sh.rustup.rs -sSf | sh -s -- -y \
    && mkdir -p ${SOURCE_DIR} ${CONFIG_DIR} \
    # && wget ${DOWNLOAD_URL} -O elastalert.tar.gz \
    && wget -nv ${DOWNLOAD_URL} -O elastalert.tar.gz \
    && tar -zxf elastalert.tar.gz -C ${SOURCE_DIR} --strip-components 1 \
    && (cd ${SOURCE_DIR} \
    && pip install --upgrade pip \
    && pip install --no-cache-dir setuptools-rust \
    && pip install --upgrade pip \
    && pip install -r requirements.txt \
    && python setup.py install) \
    && cp ${SOURCE_DIR}/config.yaml.example ${CONFIG_DIR}/config.yaml \
    && ln -sf /usr/share/zoneinfo/${TZ} /etc/localtime \
    && echo ${TZ} > /etc/timezone \
    && apk del .build-deps \
    && rm -rf ~/.cache elastalert.tar.gz ${SOURCE_DIR} /var/cache/apk/*

ENTRYPOINT ["elastalert"]

CMD ["--verbose","--config","/etc/elastalert/config.yaml"]
