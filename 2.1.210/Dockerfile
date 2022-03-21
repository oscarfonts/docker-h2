# openjdk:11 image built on Debian GNU/Linux 11 (bullseye)
FROM openjdk:11

# A merge of:
#  https://github.com/zhilvis/docker-h2
#  https://github.com/zilvinasu/h2-dockerfile

LABEL maintainer="oscar.fonts@geomatico.es"

ENV DOWNLOAD https://github.com/h2database/h2database/releases/download/version-2.1.210/h2-2022-01-17.zip
ENV DATA_DIR /opt/h2-data

RUN mkdir -p ${DATA_DIR}
RUN curl -L ${DOWNLOAD} -o h2.zip
RUN unzip h2.zip -d /opt/
RUN rm h2.zip

COPY h2.server.properties /root/.h2.server.properties

EXPOSE 81 1521

WORKDIR /opt/h2-data

CMD java -cp /opt/h2/bin/h2*.jar org.h2.tools.Server \
    -web -webAllowOthers -webPort 81 \
    -tcp -tcpAllowOthers -tcpPort 1521 \
    -baseDir ${DATA_DIR} ${H2_OPTIONS}
