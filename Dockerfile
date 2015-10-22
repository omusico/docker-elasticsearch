# Elasticsearch

FROM fedora:21
MAINTAINER omusico <omusico@gmail.com>

ENV ES_VERSION 2.0.0-beta2

RUN yum install -y java-1.8.0-openjdk

RUN wget -q https://download.elasticsearch.org/elasticsearch/release/org/elasticsearch/distribution/tar/elasticsearch/$ES_VERSION/elasticsearch-$ES_VERSION.tar.gz -O - | tar zxvf - && \
    mv /elasticsearch-$ES_VERSION /elasticsearch && \
    rm /elasticsearch/bin/*.exe

ADD elasticsearch.yml /elasticsearch/config/elasticsearch.yml

VOLUME ["/data", "/logs"]

EXPOSE 9200 9300
CMD ["elasticsearch/bin/elasticsearch"]