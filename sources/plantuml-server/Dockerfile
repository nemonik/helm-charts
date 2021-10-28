FROM maven:3-jdk-11-slim AS builder

RUN keytool -genkey -keyalg RSA -noprompt -alias tomcat -dname "CN=localhost, OU=NA, O=NA, L=NA, S=NA, C=NA" -keystore keystore.jks -validity 9999 -storepass changeme -keypass changeme

FROM plantuml/plantuml-server:tomcat

COPY --from=builder keystore.jks /usr/local/tomcat/conf/keystore.jks

COPY server.xml /usr/local/tomcat/conf/server.xml

EXPOSE 443
