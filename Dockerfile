FROM maven AS build
WORKDIR /build
COPY . . 
RUN mvn clean package

FROM eclipse-temurin:17-jre-alpine AS deploy
WORKDIR /deploy
COPY --from=build target/*.jar app.jar
CMD java -jar app.jar
