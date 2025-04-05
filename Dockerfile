FROM maven AS build
COPY . . 
RUN mvn clean package

FROM amazoncorrecto AS deploy
COPY --from=build target/*.jar app.jar
CMD java -jar app.jar
