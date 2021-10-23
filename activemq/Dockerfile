FROM openjdk:11.0.2-jre-slim-stretch

LABEL maintainer "Michael Buluma <ops@buluma.co.ke>"

ENV ACTIVEMQ_VERSION 5.16.3
ENV ACTIVEMQ_MQTT     1883
ENV ACTIVEMQ_AMQP     5672
ENV ACTIVEMQ_UI       8161
ENV ACTIVEMQ_STOMP    61613
ENV ACTIVEMQ_WS       61614
ENV ACTIVEMQ_TCP      61616
ENV ACTIVEMQ_HOME /opt/activemq
ENV ACTIVEMQ apache-activemq-${ACTIVEMQ_VERSION}
ENV ACTIVEMQ_DOWNLOAD_URL https://archive.apache.org/dist/activemq/${ACTIVEMQ_VERSION}/${ACTIVEMQ}-bin.tar.gz
ENV ACTIVEMQ_SHA512_VAL 3394afe9963f55cf62dafb287bdc58cac1fb76a614cc87939bec7b7909972eb5b3069022a9eb324242a315899b1096335c0531af75152c74eb309c0c5981b217


RUN apt-get update \
    && apt-get upgrade -y --allow-unauthenticated \
    && apt-get install bash tzdata curl -y --allow-unauthenticated \
    && curl ${ACTIVEMQ_DOWNLOAD_URL} -o ${ACTIVEMQ}-bin.tar.gz \
    && if [ "${ACTIVEMQ_SHA512_VAL}" != "$(sha512sum ${ACTIVEMQ}-bin.tar.gz | awk '{print($1)}')" ]; then \
         echo "sha512 values doesn't match! exiting." && exit 1; \
       fi \
    && tar xzf ${ACTIVEMQ}-bin.tar.gz -C /opt \
    && ln -s /opt/${ACTIVEMQ} ${ACTIVEMQ_HOME} \
    && useradd activemq -U -d ${ACTIVEMQ_HOME} -s /usr/sbin/nologin \
    && chown -R activemq:activemq /opt/${ACTIVEMQ} \
    && chown -h activemq:activemq ${ACTIVEMQ_HOME} \
    && ln -sf /usr/share/zoneinfo/${TZ} /etc/localtime \
    && echo ${TZ} > /etc/timezone \
    && apt-get clean

USER activemq

WORKDIR ${ACTIVEMQ_HOME}

EXPOSE ${ACTIVEMQ_TCP}
EXPOSE ${ACTIVEMQ_AMQP}
EXPOSE ${ACTIVEMQ_STOMP}
EXPOSE ${ACTIVEMQ_MQTT}
EXPOSE ${ACTIVEMQ_WS}
EXPOSE ${ACTIVEMQ_UI}

CMD ["/bin/bash", "-c", "bin/activemq console"]
