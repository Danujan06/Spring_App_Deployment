
FROM eclipse-temurin:17-jdk-alpine

# Set the working directory
WORKDIR /app

COPY target/AutomatedHydroponicsSystem.jar AutomatedHydroponicsSystem.jar

EXPOSE 8080

CMD ["java", "-jar", "AutomatedHydroponicsSystem.jar"]
