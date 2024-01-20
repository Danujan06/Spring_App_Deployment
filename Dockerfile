# Step 1: Build the Spring Boot app using Maven
#FROM maven:3.8.4-openjdk-17-slim AS build
FROM eclipse-temurin:17-jdk-alpine 

# Set the working directory
WORKDIR /app

COPY target/AutomatedHydroponicsSystem-0.0.1-SNAPSHOT.jar AutomatedHydroponicsSystem-0.0.1-SNAPSHOT.jar

EXPOSE 8080

CMD ["java", "-jar", "AutomatedHydroponicsSystem-0.0.1-SNAPSHOT.jar"]

