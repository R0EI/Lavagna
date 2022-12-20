# Docker file for demo purposes

# Alpine - so download is fast
FROM openjdk:8-jre-alpine

EXPOSE 8080

# Use local file as database - who cares
ENV DB_DIALECT HSQLDB
ENV DB_URL jdbc:mysql:file:lavagna
ENV DB_USER sa
ENV DB_PASS ""
ENV SPRING_PROFILE dev

RUN apk update && apk add ca-certificates && update-ca-certificates && apk add openssl


# Execute the web archive
CMD java -Xms64m -Xmx128m -Ddatasource.dialect="${DB_DIALECT}" \
-Ddatasource.url="${DB_URL}" \
-Ddatasource.username="${DB_USER}" \
-Ddatasource.password="${DB_PASS}" \
-Dspring.profiles.active="${SPRING_PROFILE}" \
-jar ./target/lavagna-jetty-console.war --headless
