FROM maven:3.6

WORKDIR /app
COPY pom.xml /app
RUN mvn clean
//RUN mvn install
RUN mvn build -f /app/pom.xml 
