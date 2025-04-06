FROM maven AS build
COPY . . 
RUN mvn clean package

FROM openjdk:11-jre-slim AS deploy
#FROM eclipse-temurin:17-jre-alpine AS deploy
COPY --from=build target/*.jar app.jar
CMD java -jar app.jar
