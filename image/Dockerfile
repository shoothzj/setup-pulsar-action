FROM shoothzj/base:jdk17

RUN wget -q https://archive.apache.org/dist/pulsar/pulsar-2.10.1/apache-pulsar-2.10.1-bin.tar.gz \
    && mkdir -p /pulsar \
    && tar -xf apache-pulsar-2.10.1-bin.tar.gz -C /pulsar --strip-components 1 \
    && rm -rf /pulsar/bin/*.cmd \
    && echo 'brokerEntryMetadataInterceptors=org.apache.pulsar.common.intercept.AppendIndexMetadataInterceptor' >> /pulsar/conf/standalone.conf \
    && echo 'exposingBrokerEntryMetadataToClientEnabled=true' >> /pulsar/conf/standalone.conf \
    && rm -rf apache-pulsar-2.10.1-bin.tar.gz

COPY conf/log4j2.yaml /pulsar/conf/log4j2.yaml

ENV PULSAR_HOME=/pulsar

WORKDIR /pulsar
