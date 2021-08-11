FROM gradle:7-jdk11-hotspot AS build

WORKDIR /app
COPY . .
RUN ./gradlew build

FROM openjdk:11

WORKDIR /app
EXPOSE 8080
COPY --from=build /app/build/libs/templator.jar templator.jar

ENTRYPOINT ["java", "-jar","templator.jar"]
