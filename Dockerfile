FROM maven:3.8.6-openjdk-8 AS builder
WORKDIR /app
COPY src /app/src
COPY LICENSE-GPLv3.txt /app/
COPY  pom.xml /app/
RUN mvn verify

FROM openjdk:8u212-jre-alpine3.9
EXPOSE 8080
WORKDIR /app
COPY entrypoint.sh /app/entrypoint.sh
COPY --from=builder /app/target /app
ENTRYPOINT  "./entrypoint.sh" 