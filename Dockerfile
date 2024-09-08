# Use an official OpenJDK 21 runtime as a parent image
FROM openjdk:21-jre-slim

# Set the working directory in the Docker container
WORKDIR /app

# Copy the JAR file from the current directory into the Docker container
COPY DadJokes-0.0.1.jar /app/DadJokes-0.0.1.jar

# Specify the command to run the JAR file
ENTRYPOINT ["java", "-jar", "/app/DadJokes-0.0.1.jar"]
