FROM maven:3.8.4-openjdk-17-slim

WORKDIR /app
COPY pom.xml /app
RUN mvn build -f /app/pom.xml 
