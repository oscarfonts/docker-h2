FROM oscarfonts/h2:1.1.119

# Adding dependencies from:
#  https://github.com/jdeolive/geodb/tree/0.7-RC2

LABEL org.opencontainers.image.authors="https://github.com/oscarfonts/docker-h2/graphs/contributors"

RUN cd /opt/h2/bin \
    && wget https://repo.osgeo.org/repository/geotools-releases/org/opengeo/geodb/0.7-RC2/geodb-0.7-RC2.jar \
    && wget https://repo1.maven.org/maven2/com/vividsolutions/jts/1.12/jts-1.12.jar \
    && wget https://repo1.maven.org/maven2/xerces/xercesImpl/2.4.0/xercesImpl-2.4.0.jar \
    && wget https://repo.osgeo.org/repository/geotools-releases/net/sourceforge/hatbox/hatbox/1.0.b11/hatbox-1.0.b11.jar
