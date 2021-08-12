FROM gradle:7-jdk11-hotspot AS build

WORKDIR /app
COPY . .
VOLUME /.gradle/caches:/.gradle/caches
RUN ./gradlew assemble check

FROM openjdk:11

WORKDIR /app
EXPOSE 8080
COPY --from=build /app/build/libs/templator.jar templator.jar

ENTRYPOINT ["java", "-jar","templator.jar"]
