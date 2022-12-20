FROM maven:3.8.6-openjdk-8
# RUN apt install npm
# RUN npm install
# RUN npm run-script lint

#ENV MAVEN_OPTS="-Xmx512m -XX:MaxPermSize=512m"

WORKDIR /app

EXPOSE 8080


COPY src /app/src
COPY LICENSE-GPLv3.txt /app/
COPY  pom.xml /app/

COPY entrypoint.sh /app/entrypoint.sh

RUN mvn verify

ENTRYPOINT  "./entrypoint.sh" 