## Step 1: Build the Spring Boot app using Maven
##FROM maven:3.8.4-openjdk-17-slim AS build
#FROM eclipse-temurin:17-jdk-alpine
#
## Set the working directory
#WORKDIR /app
#
#COPY target/AutomatedHydroponicsSystem-0.0.1-SNAPSHOT.jar AutomatedHydroponicsSystem-0.0.1-SNAPSHOT.jar
#
#EXPOSE 8080
#
#CMD ["java", "-jar", "AutomatedHydroponicsSystem-0.0.1-SNAPSHOT.jar"]
#

# Step 1: Build the Spring Boot app using Maven
FROM maven:3.8.4-openjdk-17-slim AS build

# Set the working directory
WORKDIR /app

# Copy the POM file to download dependencies
COPY pom.xml .

# Download dependencies
RUN mvn dependency:go-offline

# Copy the application source code
COPY src ./src

# Build the application
RUN mvn clean install -DskipTests

# Step 2: Serve the app using OpenJDK
FROM openjdk:17-jdk-slim

# Set the working directory
WORKDIR /app

# Copy the JAR file from the build stage
COPY --from=build /app/target/AutomatedHydroponicsSystem-0.0.1-SNAPSHOT.jar .

# Expose the port your Spring Boot app is running on
EXPOSE 8080

# Define the entry point
CMD ["java", "-jar", "AutomatedHydroponicsSystem-0.0.1-SNAPSHOT.jar"]