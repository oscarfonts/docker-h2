FROM openjdk:jre-alpine

# A merge of:
#  https://github.com/zhilvis/docker-h2
#  https://github.com/zilvinasu/h2-dockerfile

LABEL org.opencontainers.image.authors="https://github.com/oscarfonts/docker-h2/graphs/contributors"

ENV DOWNLOAD https://github.com/h2database/h2database/releases/download/version-2.1.214/h2-2022-06-13.zip
ENV DATA_DIR /opt/h2-data

RUN apk add --no-cache curl

RUN mkdir -p ${DATA_DIR} \
    && curl -L ${DOWNLOAD} -o h2.zip \
    && unzip h2.zip -d /opt/ \
    && rm h2.zip

COPY h2.server.properties /root/.h2.server.properties

EXPOSE 81 1521

WORKDIR /opt/h2-data

COPY h2cli.sh h2cli
RUN chmod a+rx h2cli && mv h2cli /opt/h2/bin    
ENV PATH="${PATH}:/opt/h2/bin"

CMD java -cp /opt/h2/bin/h2*.jar org.h2.tools.Server \
 	-web -webAllowOthers -webPort 81 \
 	-tcp -tcpAllowOthers -tcpPort 1521 \
 	-baseDir ${DATA_DIR} ${H2_OPTIONS}
