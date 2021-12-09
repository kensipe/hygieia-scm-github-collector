FROM openjdk:8-jre

VOLUME ["/hygieia/logs"]

# RUN mkdir /hygieia/config

EXPOSE 8081
COPY config/application.properties /hygieia/config/application.properties
ENV PROP_FILE /hygieia/config/application.properties

WORKDIR /hygieia

COPY target/*.jar /hygieia/
COPY docker/properties-builder.sh /hygieia/

CMD java -Djava.security.egd=file:/dev/./urandom -jar *.jar --spring.config.location=$PROP_FILE