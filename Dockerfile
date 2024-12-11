FROM maven:3-eclipse-temurin-8-alpine AS build

WORKDIR /jdd

COPY pom.xml .
COPY src src

RUN mvn package

FROM eclipse-temurin:8-alpine

WORKDIR /jdd

COPY --from=build /jdd/target/JDD-1.0-SNAPSHOT.jar jdd.jar

ENTRYPOINT ["java", "-jar", "jdd.jar"]
