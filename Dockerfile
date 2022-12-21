FROM maven:3.8.6-openjdk-8

WORKDIR /app

EXPOSE 8080


COPY src /app/src
COPY LICENSE-GPLv3.txt /app/
COPY  pom.xml /app/

COPY entrypoint.sh /app/entrypoint.sh

RUN mvn verify

ENTRYPOINT  "./entrypoint.sh" 