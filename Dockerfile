# Use an official OpenJDK runtime as a parent image
FROM openjdk:11-jre-slim

# Set the working directory in the Docker container
WORKDIR /app

# Copy the JAR file into the Docker container
COPY DadJokes-0.0.1.jar /app/DadJokes-0.0.1.jar

# Specify the command to run the JAR file
ENTRYPOINT ["java", "-jar", "/app/DadJokes-0.0.1.jar"]
