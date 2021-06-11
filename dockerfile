FROM openjdk:8-jre-alpine

ENV USER=panorama
ENV PASSWORD=admin
ENV ANONYMUS=allow-anonymous
ENV HOST=0.0.0.0
ENV MQ=mq
ENV HOME=/apache-artemis-2.17.0/bin

EXPOSE 8161  61616

RUN apk add  libaio wget \
&& wget -O artemis.tar.gz http://archive.apache.org/dist/activemq/activemq-artemis/2.17.0/apache-artemis-2.17.0-bin.tar.gz \
&& tar -xzf artemis.tar.gz

WORKDIR ${HOME}
 
RUN ./artemis create ${MQ} --user ${USER} --password ${PASSWORD} --${ANONYMUS} --http-host ${HOST}

WORKDIR ${HOME}/${MQ}/bin

CMD ["./artemis", "run"]





