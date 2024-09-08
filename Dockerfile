# Use an official OpenJDK 22 runtime as a parent image
FROM openjdk:22-jre-slim

# Set the working directory in the Docker container
WORKDIR /app

# Copy the JAR file from the target directory into the Docker container
COPY target/DadJokes-0.0.1.jar /app/DadJokes-0.0.1.jar

# Specify the command to run the JAR file
ENTRYPOINT ["java", "-jar", "/app/DadJokes-0.0.1.jar"]
